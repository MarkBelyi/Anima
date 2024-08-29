import 'package:flutter/material.dart';
import '../Theme/Color/colors.dart';
import '../Theme/Typography/typography.dart';

class GhostButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color textColor;
  final Color disabledTextColor;
  final bool isEnabled;

  const GhostButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.textColor = AppColors.semanticRed,
    this.disabledTextColor = AppColors.neutralGrayLight,
    this.isEnabled = false
  });


  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: isEnabled ? onPressed : null,
      style: TextButton.styleFrom(
        foregroundColor: isEnabled ? textColor : disabledTextColor,
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        textStyle: AppTypography.body1
        ),
      child: Text(text),
    );
  }
}
