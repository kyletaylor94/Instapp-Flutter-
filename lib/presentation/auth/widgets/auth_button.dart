import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final String placeholder;
  final VoidCallback task;

  const AuthButton({
    super.key,
    required this.placeholder,
    required this.task,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: task,
      child: Container(
        width: MediaQuery.of(context).size.width - 32,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: Colors.white24,
        ),
        child: Center(
          child: Text(
            placeholder,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
