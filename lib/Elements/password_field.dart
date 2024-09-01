import 'package:flutter/material.dart';
import '../Theme/Color/colors.dart';
import '../Theme/Typography/typography.dart';

class CustomPasswordField extends StatefulWidget {
  final String hintText;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final bool? autofocus;

  const CustomPasswordField({
    super.key,
    String? hintText,
    this.controller,
    this.onChanged,
    this.onSubmitted,
    this.autofocus = false,
  }) : hintText = hintText ?? 'Text input';

  @override
  _CustomPasswordFieldState createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  late TextEditingController _controller;
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _obscureText = true;
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      obscureText: _obscureText,
      autofocus: widget.autofocus ?? false,
      onChanged: widget.onChanged,
      onSubmitted: widget.onSubmitted,
      cursorColor: AppColors.primaryGreenLight,
      decoration: InputDecoration(
        hintText: widget.hintText,
        contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
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
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility_off : Icons.visibility,
            color: AppColors.neutralGray,
          ),
          onPressed: _toggleVisibility,
        ),
      ),
    );
  }
}
