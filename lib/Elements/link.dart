import 'package:anima/Theme/Typography/typography.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Theme/Color/colors.dart';

class CustomLink extends StatelessWidget {
  final String text;
  final String url;
  final Color textColor;

  const CustomLink({
    super.key,
    required this.text,
    required this.url,
    this.textColor = AppColors.primaryGreenLight,
  });

  Future<void> _launchURL() async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: _launchURL,
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        minimumSize: const Size(0, 0),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Text(
        text,
        style: AppTypography.caption1.copyWith(color: textColor),
      ),
    );
  }
}
