
import 'package:anima/Theme/Typography/typography.dart';
import 'package:flutter/material.dart';
import '../Theme/Color/colors.dart';

class CustomButtonPrimary extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color backgroundColor;
  final Color disabledBackgroundColor;
  final Color textColor;
  final bool isEnabled;

  const CustomButtonPrimary({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = AppColors.primaryGreenLight,
    this.disabledBackgroundColor = AppColors.primaryLight,
    this.textColor = AppColors.neutralWhite,
    this.isEnabled = true
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,

        child: ElevatedButton(

          onPressed: isEnabled ? onPressed : null,

          style: ElevatedButton.styleFrom(

            backgroundColor: isEnabled ? backgroundColor : disabledBackgroundColor,
            elevation: 0,

            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),

            textStyle: AppTypography.body1.copyWith(color: textColor),

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),

          ),

          child: Text(
            text,
            style: TextStyle(
              color: textColor,
            ),
          ),
        )
    );

  }
}
