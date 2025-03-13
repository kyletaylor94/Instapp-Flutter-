import 'package:flutter/material.dart';
import 'package:insta_app_flutter/presentation/auth/widgets/auth_button.dart';
import 'package:insta_app_flutter/presentation/auth/widgets/auth_navigator_button.dart';
import 'package:insta_app_flutter/presentation/auth/widgets/auth_textfield.dart';
import 'package:insta_app_flutter/presentation/auth/widgets/custom_background.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
                const AuthTextfield(
                  icon: Icons.email,
                  placeholder: 'Email',
                ),
                const SizedBox(height: 10),
                const AuthTextfield(
                    icon: Icons.lock,
                    placeholder: 'Password',
                    isPassword: true),
                const SizedBox(height: 10),
                createForgotButton(),
                const SizedBox(height: 10),
                AuthButton(
                  placeholder: 'Sign In',
                  task: () => print('sign in button tapped'),
                ),
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
