import 'package:flutter/material.dart';
import '../Theme/Color/colors.dart';

class ArrowRight extends StatelessWidget{
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color disabledBackgroundColor;
  final bool isEnabled;
  final double size;

  const ArrowRight({
    super.key,
    required this.onPressed,
    this.backgroundColor = AppColors.primaryGreenLight,
    this.disabledBackgroundColor = AppColors.primaryLight,
    this.isEnabled = true,
    this.size = 50.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(

      width: size,
      height: size,
      decoration: BoxDecoration(
        color: isEnabled ? backgroundColor : disabledBackgroundColor,
        shape: BoxShape.circle
      ),

      child: IconButton(
        onPressed: isEnabled ? onPressed : null,

        padding: const EdgeInsets.all(0.0),
        splashRadius: size * 0.6,

        icon: Icon(
          Icons.arrow_forward_sharp,
          color: AppColors.neutralWhite,
          size: size * 0.5,
        ),

      )
    );
  }
}