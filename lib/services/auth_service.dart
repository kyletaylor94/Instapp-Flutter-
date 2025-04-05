import 'package:insta_app_flutter/data/mock_users.dart';
import 'package:insta_app_flutter/entity/current_user.dart';

abstract class AuthService {
  Future<void> login(String email, String password);
  Future<void> register(
      String email, String password, String fullName, String userName);
  Future<void> logout();
  Future<CurrentUser> fetchCurrentUser();
}

class AuthServiceImpl extends AuthService {
  @override
  Future<CurrentUser> fetchCurrentUser() async {
    return MockUsers.users[0];
  }

  @override
  Future<void> login(String email, String password) async {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<void> logout() async {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<void> register(
      String email, String password, String fullName, String userName) async {
    // TODO: implement register
    throw UnimplementedError();
  }
}
