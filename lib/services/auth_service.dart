import 'package:colorful_print/colorful_print.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:insta_app_flutter/data/constants.dart';
import 'package:insta_app_flutter/data/mock_users.dart';
import 'package:insta_app_flutter/entity/current_user.dart';
import 'package:insta_app_flutter/entity/devicetoken_post_entity.dart';
import 'package:insta_app_flutter/entity/login_post_entity.dart';
import 'package:insta_app_flutter/entity/register_post_entity.dart';
import 'package:insta_app_flutter/entity/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

abstract class AuthService {
  Future<void> fetchToken();
  Future<void> login(String email, String password);
  Future<void> register(
      String name, String email, String password, String confirmPassword);
  Future<void> logout();
  Future<CurrentUser> fetchCurrentUser();
  Future<User> fetchCurrentUserFromAPI();

  Future<void> saveTokens(String authToken, String refreshToken);
  Future<void> loadTokens();
  Future<void> clearTokens();
}

class AuthServiceImpl extends AuthService {
  final dio = Dio();
  final constants = Constants();
  final uuid = const Uuid();

  String? authToken;
  String? refreshToken;

  @override
  Future<void> clearTokens() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('authToken');
    await prefs.remove('refreshToken');
  }

  @override
  Future<void> loadTokens() async {
    final prefs = await SharedPreferences.getInstance();
    authToken = prefs.getString('authToken');
    refreshToken = prefs.getString('refreshToken');
  }

  @override
  Future<void> saveTokens(String authToken, String refreshToken) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('authToken', authToken);
    await prefs.setString('refreshToken', refreshToken);
  }

  @override
  Future<void> fetchToken() async {
    try {
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;

      final requestData = DeviceTokenPostEntity(
        deviceName: androidInfo.model,
        deviceToken: "apn-token-${uuid.v4()}",
        platform: "android",
      );

      final response = await dio.post(
        constants.baseUrl + constants.fetchDeviceUrl,
        data: requestData.toJson(),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data;

        print('Token API response: $data');

        authToken = data['token'];
        refreshToken = data['refreshToken'];

        await saveTokens(authToken!, refreshToken!);

        printColor(
          'Save successfully: $authToken, $refreshToken',
          textColor: TextColor.green,
        );
      } else {
        printColor(
          'Failed to fetch token! status code: ${response.statusCode}',
          textColor: TextColor.red,
        );
        throw Exception(
            'Failed to fetch token! Status code: ${response.statusCode}');
      }
    } catch (e) {
      printColor('Error in fetchToken: $e', textColor: TextColor.red);
      rethrow;
    }
  }

  @override
  Future<void> login(String email, String password) async {
    await loadTokens();
    await _loadHeaders();

    final requestData = LoginPostEntity(
      email: email,
      password: password,
    );

    try {
      final response = await dio.post(
        constants.baseUrl + constants.loginUrl,
        data: requestData.toJson(),
      );
      printColor(
        'Login was success: ${response.data}',
        textColor: TextColor.green,
      );
    } catch (e) {
      if (e is DioException && e.response != null) {
        printColor(
          'Server error details: ${e.response?.data}',
          textColor: TextColor.red,
        );
      } else {
        printColor('Login failed with error: $e', textColor: TextColor.red);
      }
    }
  }

  @override
  Future<void> logout() async {
    await loadTokens();
    await _loadHeaders();

    try {
      final response = await dio.post(constants.baseUrl + constants.logoutUrl);
      printColor(
        'LogOut was success: ${response.data}',
        textColor: TextColor.green,
      );
    } catch (e) {
      if (e is DioException && e.response != null) {
        printColor('Server error details: ${e.response?.data}',
            textColor: TextColor.red);
      } else {
        printColor('Logout failed with error: $e', textColor: TextColor.red);
      }
    }
  }

  @override
  Future<void> register(String name, String email, String password,
      String confirmPassword) async {
    await loadTokens();
    await _loadHeaders();

    final requestData = RegisterPostEntity(
      name: name,
      email: email,
      password: password,
      confirmPassword: confirmPassword,
    );

    try {
      final response = await dio.post(
        constants.baseUrl + constants.registerUrl,
        data: requestData.toJson(),
      );

      printColor('Registration was success: ${response.data}',
          textColor: TextColor.green);
    } catch (e) {
      if (e is DioException && e.response != null) {
        printColor('Server error details: ${e.response?.data}',
            textColor: TextColor.red);
      } else {
        printColor('Registration failed with error: $e',
            textColor: TextColor.red);
      }
    }
  }

  @override
  Future<CurrentUser> fetchCurrentUser() async {
    return MockUsers.users[0];
  }

  @override
  Future<User> fetchCurrentUserFromAPI() async {
    await loadTokens();
    await _loadHeaders();

    // Check if tokens are valid, if not fetch new ones
    if (authToken == null || refreshToken == null) {
      printColor('No tokens found when fetching user, fetching new tokens',
          textColor: TextColor.red);
      await fetchToken();
    }

    try {
      final response =
          await dio.get(constants.baseUrl + constants.fetchCurrenUserUrl);
      printColor(
        'Current user API response: ${response.data}',
        textColor: TextColor.green,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return User.fromJson(response.data);
      } else {
        printColor('Failed to fetch user: ${response.statusCode}',
            textColor: TextColor.red);
        throw Exception('Failed to fetch user: ${response.statusCode}');
      }
    } catch (e) {
      if (e is DioException && e.response != null) {
        printColor('Server error details: ${e.response?.data}',
            textColor: TextColor.red);
        printColor('Status code: ${e.response?.statusCode}',
            textColor: TextColor.red);
      } else {
        printColor('Cannot fetch current user with this error: $e');
      }
      throw Exception('Failed to fetch current user');
    }
  }
}

extension AuthServiceExtensions on AuthServiceImpl {
  Future<void> _loadHeaders() async {
    dio.options.headers['content-Type'] = 'application/json';
    dio.options.headers['authorization'] = 'Bearer $authToken';
  }
}
