import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insta_app_flutter/presentation/auth/widgets/auth_button.dart';
import 'package:insta_app_flutter/presentation/auth/widgets/auth_navigator_button.dart';
import 'package:insta_app_flutter/presentation/auth/widgets/auth_textfield.dart';
import 'package:insta_app_flutter/presentation/auth/widgets/custom_background.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  File? _avatarImage;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _avatarImage = File(pickedFile.path);
      });
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
                const SizedBox(height: 20),
                createAvatarPicker(),
                const SizedBox(height: 20),
                const AuthTextfield(
                  icon: Icons.email,
                  placeholder: 'Email',
                ),
                const SizedBox(height: 10),
                const AuthTextfield(
                  icon: Icons.lock,
                  placeholder: 'Password',
                  isPassword: true,
                ),
                const SizedBox(height: 10),
                const AuthTextfield(
                  icon: Icons.person,
                  placeholder: 'Full name',
                ),
                const SizedBox(height: 10),
                const AuthTextfield(
                  icon: Icons.person,
                  placeholder: 'Username',
                ),
                const SizedBox(height: 30),
                AuthButton(placeholder: 'Sign up', task: () {}),
                const Spacer(),
                const AuthNavigatorButton(
                  placeholderTitle: "Already have an account?",
                  placeholderSubTitle: 'Sign In!',
                  isRegisterPage: true,
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget createAvatarPicker() {
    return GestureDetector(
      onTap: _pickImage,
      child: CircleAvatar(
        radius: 40,
        backgroundColor: Colors.white24,
        backgroundImage: _avatarImage != null ? FileImage(_avatarImage!) : null,
        child: _avatarImage == null
            ? const Icon(
                Icons.person,
                size: 70,
                color: Colors.white,
              )
            : null,
      ),
    );
  }
}
