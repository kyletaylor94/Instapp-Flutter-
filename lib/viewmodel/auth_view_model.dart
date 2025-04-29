import 'package:flutter/material.dart';
import 'package:insta_app_flutter/entity/current_user.dart';
import 'package:insta_app_flutter/entity/user.dart';
import 'package:insta_app_flutter/usecases/auth_usecase.dart';

class AuthViewModel extends ChangeNotifier {
  CurrentUser? currentUser;
  User? currentUserFromAPI;
  bool? isAuthenticated;

  final AuthUsecase _authUsecase;

  AuthViewModel(this._authUsecase);

  Future<void> fetchCurrentUser() async {
    try {
      currentUser = await _authUsecase.getCurrentUser();
    } catch (e) {
      print('Error! $e');
    }
  }

  Future<void> fetchCurrentUserFromAPI() async {
    notifyListeners();

    try {
      currentUserFromAPI = await _authUsecase.fetchCurrentUserFromAPI();
      notifyListeners();
      print(currentUserFromAPI!);
    } catch (e) {
      print('Cannot fetch currentUserFromAPI: $e');
      notifyListeners();
    }
  }

  Future<void> signIn(String email, String password) async {
    notifyListeners();

    try {
      print('Attempting login with email: $email');
      await _authUsecase.login(email, password);
      print('Login successful, fetching user data');

      try {
        currentUserFromAPI = await _authUsecase.fetchCurrentUserFromAPI();
        print('User data retrieved: ${currentUserFromAPI?.email ?? "Unknown"}');
        isAuthenticated = true;
      } catch (userError) {
        print('Login successful but failed to get user: $userError');
        isAuthenticated = true;
      }

      notifyListeners();
    } catch (e) {
      print('Error! Cannot login! $e');
      isAuthenticated = false;
      notifyListeners();
    }
  }

  Future<void> signOut() async {
    notifyListeners();

    try {
      await _authUsecase.signOut();
      currentUserFromAPI = null;
      isAuthenticated = false;
      notifyListeners();
    } catch (e) {
      print('Error! Cannot signout $e');
      notifyListeners();
    }
  }

  Future<void> signUp(String name, String email, String password,
      String confirmPassword) async {
    notifyListeners();

    try {
      await _authUsecase.register(name, email, password, confirmPassword);
      currentUserFromAPI = await _authUsecase.fetchCurrentUserFromAPI();
      isAuthenticated = true;
      notifyListeners();
    } catch (e) {
      print('Error! Cannot register! $e');
      notifyListeners();
    }
  }

  Future<void> checkLoginStatus() async {
    notifyListeners();

    try {
      final result = await _authUsecase.checkLoginStatus();
      currentUserFromAPI = result.item1;
      isAuthenticated = result.item2;
      notifyListeners();
    } catch (e) {
      print('Cannot checkLoginStatus! $e');
      notifyListeners();
    }
  }
}
