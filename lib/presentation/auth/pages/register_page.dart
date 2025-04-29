import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insta_app_flutter/presentation/auth/widgets/auth_button.dart';
import 'package:insta_app_flutter/presentation/auth/widgets/auth_navigator_button.dart';
import 'package:insta_app_flutter/presentation/auth/widgets/auth_textfield.dart';
import 'package:insta_app_flutter/presentation/auth/widgets/custom_background.dart';
import 'package:insta_app_flutter/presentation/bottomtabbar/bottom_navigation_bar.dart';
import 'package:insta_app_flutter/viewmodel/auth_view_model.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  File? _avatarImage;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  Future<void> _signUp(BuildContext content) async {
    final authViewModel = Provider.of<AuthViewModel>(content, listen: false);

    await authViewModel.signUp(
      _nameController.text,
      _emailController.text,
      _passwordController.text,
      _confirmPasswordController.text,
    );

    if (authViewModel.isAuthenticated == true) {
      if (content.mounted) {
        Navigator.pushReplacement(
          // ignore: use_build_context_synchronously
          context,
          MaterialPageRoute(
            builder: (context) => const BottomNavBar(),
          ),
        );
      }
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Registration failed!'),
        ),
      );
    }
  }

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
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _nameController.dispose();
    super.dispose();
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
                _createTextfields(context),
                AuthButton(
                  placeholder: 'Sign up',
                  task: () async => await _signUp(context),
                ),
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

  Widget _createTextfields(BuildContext context) {
    return Column(
      children: [
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
        AuthTextfield(
          icon: Icons.lock,
          placeholder: 'Confirm Password',
          isPassword: true,
          controller: _confirmPasswordController,
        ),
        const SizedBox(height: 10),
        AuthTextfield(
          icon: Icons.person,
          placeholder: 'Full name',
          controller: _nameController,
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
