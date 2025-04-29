import 'package:insta_app_flutter/entity/current_user.dart';
import 'package:insta_app_flutter/entity/user.dart';
import 'package:insta_app_flutter/repository/auth_repository.dart';
import 'package:tuple/tuple.dart';

abstract class AuthUsecase {
  Future<void> fetchTokens();
  Future<CurrentUser> getCurrentUser();
  Future<void> login(String email, String password);
  Future<void> register(
      String name, String email, String password, String confirmPassword);
  Future<void> signOut();

  Future<User> fetchCurrentUserFromAPI();

  Future<Tuple2<User?, bool>> checkLoginStatus();
}

class AuthUsecaseImpl extends AuthUsecase {
  final AuthRepository _repository;
  AuthUsecaseImpl(this._repository);

  @override
  Future<void> fetchTokens() async {
    return await _repository.fetchTokens();
  }

  @override
  Future<CurrentUser> getCurrentUser() async {
    return await _repository.fetchCurrentUser();
  }

  @override
  Future<void> login(String email, String password) async {
    return await _repository.login(email, password);
  }

  @override
  Future<void> register(String name, String email, String password,
      String confirmPassword) async {
    await fetchTokens();
    return await _repository.register(name, email, password, confirmPassword);
  }

  @override
  Future<void> signOut() async {
    return await _repository.logout();
  }

  @override
  Future<User> fetchCurrentUserFromAPI() async {
    return await _repository.fetchCurrentUserFromAPI();
  }

  @override
  Future<Tuple2<User?, bool>> checkLoginStatus() async {
    final user = await fetchCurrentUserFromAPI();

    print('CHECKLOGINSTATUS: \(${user.isActive})');

    if (user.isActive != null) {
      return Tuple2(user, true);
    } else {
      return const Tuple2(null, false);
    }
  }
}
