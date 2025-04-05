import 'package:insta_app_flutter/entity/current_user.dart';
import 'package:insta_app_flutter/repository/auth_repository.dart';

abstract class AuthUsecase {
  Future<CurrentUser> getCurrentUser();
  Future<void> login(String email, String password);
  Future<void> register(
      String email, String password, String fullName, String userName);
  Future<void> signOut();
}

class AuthUsecaseImpl extends AuthUsecase {
  final AuthRepository _repository;
  AuthUsecaseImpl(this._repository);

  @override
  Future<CurrentUser> getCurrentUser() async {
    return await _repository.fetchCurrentUser();
  }

  @override
  Future<void> login(String email, String password) async {
    return await _repository.login(email, password);
  }

  @override
  Future<void> register(
      String email, String password, String fullName, String userName) async {
    return await _repository.register(email, password, fullName, userName);
  }

  @override
  Future<void> signOut() async {
    return await _repository.logout();
  }
}
