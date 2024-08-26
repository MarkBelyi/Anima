import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomLink extends StatelessWidget {
  final String text;
  final String url;
  final Color textColor;

  const CustomLink({
    Key? key,
    required this.text,
    required this.url,
    this.textColor = Colors.blue, // Цвет текста по умолчанию
  }) : super(key: key);

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
        minimumSize: Size(0, 0),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
