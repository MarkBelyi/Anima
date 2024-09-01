import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import '../Theme/Color/colors.dart';
import '../Theme/Typography/typography.dart';

class AddCardButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color textColor;
  final Color borderColor;
  final double borderWidth;
  final double borderRadius;
  final double dashLength;
  final double spaceBetweenDashes;

  const AddCardButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.textColor = AppColors.primaryGreenDark,
    this.borderColor = AppColors.primaryGreenDark,
    this.borderWidth = 2.0,
    this.borderRadius = 3.0,
    this.dashLength = 11.0,
    this.spaceBetweenDashes = 11.0,
  });

  @override
  Widget build(BuildContext context) {
    
    return DottedBorder(
      color: borderColor,
      strokeWidth: borderWidth,
      dashPattern: [dashLength, spaceBetweenDashes],
      borderType: BorderType.RRect,
      radius: Radius.circular(borderRadius),

      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          textStyle: AppTypography.body3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),

        child: Text(text,
          style: TextStyle(
            color: textColor,
          ),
        ),
      ),
    );
  }
}
