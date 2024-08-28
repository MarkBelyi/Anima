import 'package:flutter/material.dart';
import '../Theme/Color/colors.dart';
import '../Theme/Typography/typography.dart';

void main() {
  runApp(GhostButtonApp());
}

class GhostButtonApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: GhostButton(
            text: 'Button',
            onPressed: () {
              print('Ghost Button Pressed');
            },
          ),
        ),
      ),
    );
  }
}

class GhostButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;

  const GhostButton({
    required this.text,
    required this.onPressed,
  });
@override
_GhostButtonState createState() => _GhostButtonState();
}

class _GhostButtonState extends State<GhostButton> {
  bool isActive = false; // Hardcoded boolean value
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: isActive ? () {} : null, // Enable or disable button based on isActive
      style: TextButton.styleFrom(
        foregroundColor: isActive ? AppColors.semanticRed : AppColors.neutralGrayLight, // Change text color based on isActive
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0), // Padding inside button
        textStyle: AppTypography.title1.copyWith(
          fontSize: 16.0,
          fontWeight: FontWeight.w500,
        ), // Use the predefined Poppins style
      ),
      child: Text(widget.text),
    );
  }
}