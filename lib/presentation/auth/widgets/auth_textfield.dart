import 'package:flutter/material.dart';

class AuthTextfield extends StatelessWidget {
  final IconData icon;
  final String placeholder;
  final bool isPassword;
  final TextEditingController? controller;

  const AuthTextfield({
    super.key,
    required this.icon,
    required this.placeholder,
    this.isPassword = false,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 32),
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white24,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          const SizedBox(width: 10),
          Icon(
            icon,
            color: Colors.white,
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: placeholder,
                hintStyle: const TextStyle(
                  color: Colors.white,
                ),
                fillColor: Colors.transparent,
                filled: true,
                border: InputBorder.none,
              ),
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
