import 'package:flutter/material.dart';
import '../Theme/Color/colors.dart';
import '../Theme/Typography/typography.dart';

class Footer extends StatelessWidget {
  final String messageText;
  final String buttonText;
  final Color messageColor;
  final Color buttonTextColor;
  final VoidCallback onButtonPressed;

  const Footer({
    super.key,
    required this.messageText,
    required this.buttonText,
    this.messageColor = AppColors.neutralDark,
    this.buttonTextColor = AppColors.primaryGreenLight,
    required this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          messageText,
          style: AppTypography.caption3.copyWith(color: messageColor),
        ),
        TextButton(
          onPressed: onButtonPressed,
          child: Text(
            buttonText,
            style: AppTypography.caption1.copyWith(color: buttonTextColor),
          ),
        ),
      ],
    );
  }
}
