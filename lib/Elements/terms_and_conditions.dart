import 'package:anima/Theme/Color/colors.dart';
import 'package:anima/Theme/Typography/typography.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../Theme/Shape/shape.dart';
import '../generated/l10n.dart';

class TermsAndConditions extends StatefulWidget {
  final bool isChecked;
  final Function(bool?) onChanged;
  final Function() onTermsTap;
  final Color checkBoxColor;
  final Color textColor;
  final Color linkColor;
  final Color disabledColor;
  final double fontSize;

  const TermsAndConditions({
    super.key,
    this.isChecked = false,
    required this.onChanged,
    required this.onTermsTap,
    this.checkBoxColor = AppColors.primaryGreenLight,
    this.textColor = AppColors.neutralDark,
    this.linkColor = AppColors.primaryGreenLight,
    this.disabledColor = AppColors.neutralGrayLight,
    this.fontSize = 14.0,
  });

  @override
  _TermsAndConditionsState createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
  bool _isChecked = false;

  @override
  void initState() {
    super.initState();
    _isChecked = widget.isChecked;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Transform.scale(
          scale: 1.3,
          child:Checkbox(
              value: _isChecked,
              onChanged: (value) {
                setState(() {
                  _isChecked = value ?? false;
                });
                widget.onChanged(_isChecked);
              },
              activeColor: widget.checkBoxColor,
              shape: AppShape.roundedCorners
          ),
        ),
        Expanded(
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: S.of(context).agreement,
                  style: AppTypography.body3.copyWith(color: widget.textColor)
                ),
                TextSpan(
                  text: S.of(context).terms_and_conditions,
                  style: AppTypography.title4.copyWith(color: widget.linkColor),
                  recognizer: TapGestureRecognizer()
                    ..onTap = widget.onTermsTap,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
