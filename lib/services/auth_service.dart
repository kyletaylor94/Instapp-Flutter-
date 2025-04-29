import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:insta_app_flutter/data/constants.dart';
import 'package:insta_app_flutter/data/mock_users.dart';
import 'package:insta_app_flutter/entity/current_user.dart';
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

      final response =
          await dio.post(constants.baseUrl + constants.fetchDeviceUrl, data: {
        "deviceName": androidInfo.model,
        "deviceToken": "apn-token-${uuid.v4()}",
        "platform": "ios"
      });

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data;

        print('Token API response: $data');

        // Use "token" instead of "authToken" to match the API response
        if (data['token'] == null || data['refreshToken'] == null) {
          throw Exception('Auth or refresh token is null in API response');
        }

        // Use "token" instead of "authToken"
        authToken = data['token'];
        refreshToken = data['refreshToken'];

        await saveTokens(authToken!, refreshToken!);
        print('Save successfully: $authToken, $refreshToken');
      } else {
        throw Exception(
            'Failed to fetch token! Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error in fetchToken: $e');
      rethrow;
    }
  }

  @override
  Future<void> login(String email, String password) async {
    await loadTokens();

    final requestData = {
      "email": email,
      "password": password,
    };

    dio.options.headers['content-Type'] = 'application/json';
    dio.options.headers['authorization'] = 'Bearer $authToken';

    try {
      final response = await dio.post(
        constants.baseUrl + constants.loginUrl,
        data: requestData,
      );
      print('Login was success: ${response.data}');
    } catch (e) {
      if (e is DioException && e.response != null) {
        print('Server error details: ${e.response?.data}');
      } else {
        print('Login failed with error: $e');
      }
    }
  }

  @override
  Future<void> logout() async {
    await loadTokens();

    dio.options.headers['content-Type'] = 'application/json';
    dio.options.headers['authorization'] = 'Bearer $authToken';

    try {
      final response = await dio.post(constants.baseUrl + constants.logoutUrl);
      print('LogOut was success: ${response.data}');
    } catch (e) {
      if (e is DioException && e.response != null) {
        print('Server error details: ${e.response?.data}');
      } else {
        print('Logout failed with error: $e');
      }
    }
  }

  @override
  Future<void> register(String name, String email, String password,
      String confirmPassword) async {
    await loadTokens();

    final requestData = {
      "name": name,
      "email": email,
      "password": password,
      "confirmPassword": confirmPassword,
    };

    dio.options.headers['content-Type'] = 'application/json';
    dio.options.headers['authorization'] = 'Bearer $authToken';

    try {
      final response = await dio.post(constants.baseUrl + constants.registerUrl,
          data: requestData);

      print('Registration was success: ${response.data}');
    } catch (e) {
      if (e is DioException && e.response != null) {
        print('Server error details: ${e.response?.data}');
      } else {
        print('Registration failed with error: $e');
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

    dio.options.headers['content-Type'] = 'application/json';
    dio.options.headers['authorization'] = 'Bearer $authToken';

    try {
      final response =
          await dio.get(constants.baseUrl + constants.fetchCurrenUserUrl);
      print('Current user API response: ${response.data}');

      if (response.statusCode == 200) {
        return User.fromJson(response.data);
      } else {
        throw Exception('Failed to fetch user: ${response.statusCode}');
      }
    } catch (e) {
      if (e is DioException && e.response != null) {
        print('Server error details: ${e.response?.data}');
        print('Status code: ${e.response?.statusCode}');
      } else {
        print('Cannot fetch current user with this error: $e');
      }
      throw Exception('Failed to fetch current user');
    }
  }
}
