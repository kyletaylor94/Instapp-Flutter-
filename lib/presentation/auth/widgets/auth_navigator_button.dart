import 'package:flutter/material.dart';
import 'package:insta_app_flutter/presentation/auth/pages/register_page.dart';

class AuthNavigatorButton extends StatelessWidget {
  final String placeholderTitle;
  final String placeholderSubTitle;
  final bool isRegisterPage;

  const AuthNavigatorButton({
    super.key,
    required this.placeholderTitle,
    required this.placeholderSubTitle,
    this.isRegisterPage = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isRegisterPage) {
          Navigator.of(context).pop();
        } else {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const RegisterPage(),
            ),
          );
        }
      },
      child: RichText(
        text: TextSpan(
          text: "$placeholderTitle ",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
          children: [
            TextSpan(
              text: placeholderSubTitle,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
