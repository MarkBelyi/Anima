import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomIllustration extends StatelessWidget {
  final String assetPath;
  final double width;
  final double height;
  final BoxFit fit;

  const CustomIllustration({
    super.key,
    required this.assetPath,
    required this.width,
    required this.height,
    this.fit = BoxFit.contain,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SvgPicture.asset(
        assetPath,
        width: width,
        height: height,
        fit: fit,
      ),
    );
  }
}
