import 'package:flutter/material.dart';

import '../Theme/Color/colors.dart';
import '../Theme/Typography/typography.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorColor: AppColors.primaryGreenLight,
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
        labelStyle: AppTypography.body3.copyWith(color: AppColors.neutralDark),
        hintStyle: AppTypography.body3.copyWith(color: AppColors.neutralGrayLight),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(color: AppColors.neutralGrayLight),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(color: AppColors.neutralGrayLight),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(color: AppColors.neutralGrayLight),
        ),
      ),
    );
  }
}
