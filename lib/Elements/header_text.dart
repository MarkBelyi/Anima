import 'package:anima/Theme/Color/colors.dart';
import 'package:anima/Theme/Typography/typography.dart';
import 'package:flutter/material.dart';

class HeaderText extends StatelessWidget{
  final String title;
  final String subtitle;
  final Color titleColor;
  final Color subtitleColor;

  const HeaderText({
    super.key,
    required this.title,
    required this.subtitle,
    this.titleColor = AppColors.primaryGreenLight,
    this.subtitleColor = AppColors.neutralDark
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTypography.title1.copyWith(color: titleColor)
        ),
        const SizedBox(height: 4),
        Text(
          subtitle,
          style: AppTypography.caption3.copyWith(color: subtitleColor)
        )
      ],
    );
  }
}