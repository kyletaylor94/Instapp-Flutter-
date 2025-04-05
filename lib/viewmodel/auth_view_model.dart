import 'package:insta_app_flutter/entity/current_user.dart';
import 'package:insta_app_flutter/usecases/auth_usecase.dart';

class AuthViewModel {
  CurrentUser? currentUser;

  final AuthUsecase _authUsecase;

  AuthViewModel(this._authUsecase);

  Future<void> fetchCurrentUser() async {
    try {
      currentUser = await _authUsecase.getCurrentUser();
    } catch (e) {
      print('Error! $e');
    }
  }

  Future<void> signIn(String email, String password) async {
    try {
      await _authUsecase.login(email, password);
    } catch (e) {
      print('Error! $e');
    }
  }

  Future<void> signOut() async {
    try {
      await _authUsecase.signOut();
    } catch (e) {
      print('Error! $e');
    }
  }

  Future<void> signUp(
      String email, String password, String fullName, String userName) async {
    try {
      await _authUsecase.register(email, password, fullName, userName);
    } catch (e) {
      print('Error! $e');
    }
  }
}
