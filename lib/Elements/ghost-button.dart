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
  bool isActive = true;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: isActive ? widget.onPressed : null,
      style: TextButton.styleFrom(
        foregroundColor: isActive ? AppColors.semanticRed : AppColors.neutralGrayLight,
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        textStyle: AppTypography.body1
        ),
      child: Text(widget.text),
    );
  }
}