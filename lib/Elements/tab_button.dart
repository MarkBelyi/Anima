import 'package:flutter/material.dart';
import '../Theme/Color/colors.dart';
import '../Theme/Typography/typography.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: TabButton(
            text: 'Tab',
            onPressed: () {
              print('Dashed Button Pressed');
            },
          ),
        ),
      ),
    );
  }
}




class TabButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color textColor;
  final Color disabledTextColor;
  final Color backgroundColor;
  final Color disabledBackgroundColor;
  final bool isEnabled;

  const TabButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.textColor = AppColors.neutralWhite,
    this.disabledTextColor = AppColors.neutralGrayLight,
    this.backgroundColor = AppColors.primaryGreenLight,
    this.disabledBackgroundColor = AppColors.primaryLight,
    this.isEnabled = false
  });


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 155,
      height: 44,
      child: ElevatedButton(
        onPressed: isEnabled ? onPressed : null,
        style: ElevatedButton.styleFrom(
            backgroundColor: isEnabled ? backgroundColor : disabledBackgroundColor,
            elevation: 0,
            foregroundColor: isEnabled ? textColor : disabledTextColor,
            //padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            textStyle: AppTypography.body1,

            shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
        ),
        child: Text(text),
      ),
    );
  }
}