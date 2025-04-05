import 'package:insta_app_flutter/entity/current_user.dart';
import 'package:insta_app_flutter/services/auth_service.dart';

abstract class AuthRepository {
  Future<void> login(String email, String password);
  Future<void> register(
      String email, String password, String fullName, String userName);
  Future<void> logout();
  Future<CurrentUser> fetchCurrentUser();
}

class AuthRepositoryImpl extends AuthRepository {
  final AuthService _authService;

  AuthRepositoryImpl(this._authService);

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
  Future<void> register(
      String email, String password, String fullName, String userName) async {
    return await _authService.register(email, password, fullName, userName);
  }
}
