import 'package:flutter/material.dart';

import '../Theme/Color/colors.dart';
import '../Theme/Typography/Typography.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color backgroundColor;
  final Color iconColor;
  final VoidCallback onLeadingPressed;

  const CustomAppBar({
    super.key,
    required this.title,
    required this.backgroundColor,
    required this.iconColor,
    required this.onLeadingPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      elevation: 0,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios_new_sharp,
          color: iconColor,
        ),
        onPressed: onLeadingPressed,
      ),
      title: Text(
        title,
        style: AppTypography.title2.copyWith(color: AppColors.neutralWhite),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
