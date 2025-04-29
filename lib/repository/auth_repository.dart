import 'package:insta_app_flutter/entity/current_user.dart';
import 'package:insta_app_flutter/entity/user.dart';
import 'package:insta_app_flutter/services/auth_service.dart';

abstract class AuthRepository {
  Future<void> fetchTokens();
  Future<void> login(String email, String password);
   Future<void> register(
      String name, String email, String password, String confirmPassword);
  Future<void> logout();
  Future<CurrentUser> fetchCurrentUser();

  Future<User> fetchCurrentUserFromAPI();
}

class AuthRepositoryImpl extends AuthRepository {
  final AuthService _authService;

  AuthRepositoryImpl(this._authService);

  @override
  Future<void> fetchTokens() async {
    return await _authService.fetchToken();
  }

  @override
  Future<CurrentUser> fetchCurrentUser() async {
    return await _authService.fetchCurrentUser();
  }

  @override
  Future<void> login(String email, String password) async {
    return await _authService.login(email, password);
  }

  @override
  Future<void> logout() async {
    return await _authService.logout();
  }
  
  @override
  Future<void> register(String name, String email, String password, String confirmPassword) async {
    return await _authService.register(name, email, password, confirmPassword);
  }
  
  @override
  Future<User> fetchCurrentUserFromAPI() async {
    return await _authService.fetchCurrentUserFromAPI();
  }  
}
