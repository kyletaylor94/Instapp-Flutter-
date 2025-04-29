import 'package:flutter/material.dart';
import 'package:insta_app_flutter/presentation/auth/widgets/auth_button.dart';
import 'package:insta_app_flutter/presentation/auth/widgets/auth_navigator_button.dart';
import 'package:insta_app_flutter/presentation/auth/widgets/auth_textfield.dart';
import 'package:insta_app_flutter/presentation/auth/widgets/custom_background.dart';
import 'package:insta_app_flutter/presentation/bottomtabbar/bottom_navigation_bar.dart';
import 'package:insta_app_flutter/viewmodel/auth_view_model.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _signIn(BuildContext context) async {
    final authViewModel = Provider.of<AuthViewModel>(context, listen: false);
    await authViewModel.signIn(_emailController.text, _passwordController.text);

    if (authViewModel.isAuthenticated == true) {
      if (context.mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const BottomNavBar(),
          ),
        );
      }
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Login failed!'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const CustomBackground(),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 40),
                Image.asset(
                  'assets/logo.png',
                  width: 300,
                  height: 100,
                ),
                AuthTextfield(
                  icon: Icons.email,
                  placeholder: 'Email',
                  controller: _emailController,
                ),
                const SizedBox(height: 10),
                AuthTextfield(
                  icon: Icons.lock,
                  placeholder: 'Password',
                  isPassword: true,
                  controller: _passwordController,
                ),
                const SizedBox(height: 10),
                createForgotButton(),
                const SizedBox(height: 10),
                AuthButton(
                    placeholder: 'Sign In',
                    task: () async {
                      await _signIn(context);
                    }),
                const Spacer(),
                const AuthNavigatorButton(
                  placeholderTitle: "Don't you have an account?",
                  placeholderSubTitle: 'Sign Up!',
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget createForgotButton() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Spacer(),
        TextButton(
          onPressed: () {},
          child: const Text(
            'Forgot password?',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(width: 25),
      ],
    );
  }
}
