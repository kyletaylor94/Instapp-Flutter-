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

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final authViewModel = Provider.of<AuthViewModel>(context, listen: false);
      _checkAuthStatus(authViewModel);
      print("INITIAL AUTH STATUS: ${authViewModel.currentUserFromAPI}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Consumer<AuthViewModel>(
        builder: (context, authViewModel, _) {
          if (authViewModel.currentUserFromAPI != null) {
            return const BottomNavBar();
          } else {
            return const LoginPage();
          }
        },
      ),
    );
  }

  void _checkAuthStatus(AuthViewModel authViewModel) async {
    await authViewModel.checkLoginStatus();
  }
}
