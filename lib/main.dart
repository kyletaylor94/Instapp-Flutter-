import 'package:flutter/material.dart';
import 'package:insta_app_flutter/presentation/auth/pages/login_page.dart';
import 'package:insta_app_flutter/presentation/bottomtabbar/bottom_navigation_bar.dart';
import 'package:insta_app_flutter/repository/auth_repository.dart';
import 'package:insta_app_flutter/services/auth_service.dart';
import 'package:insta_app_flutter/usecases/auth_usecase.dart';
import 'package:insta_app_flutter/viewmodel/auth_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AuthViewModel(
        AuthUsecaseImpl(
          AuthRepositoryImpl(
            AuthServiceImpl(),
          ),
        ),
      ),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Consumer<AuthViewModel>(builder: (context, authViewModel, _) {
        if (authViewModel.isAuthenticated == true) {
          return const BottomNavBar();
        } else {
          return const LoginPage();
        }
      }),
    );
  }

  void _checkAuthStatus(AuthViewModel authViewModel) async {
    await authViewModel.checkLoginStatus();
  }
}
