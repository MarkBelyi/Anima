import 'package:flutter/material.dart';
import '../Theme/Color/colors.dart';
import '../Theme/Typography/typography.dart';

class ForgotPasswordButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final VoidCallback onPressed;

  const ForgotPasswordButton({
    super.key,
    required this.text,
    this.textColor = AppColors.neutralGrayLight,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: AppTypography.caption3.copyWith(color: textColor),
        ),
      ),
    );
  }
}
