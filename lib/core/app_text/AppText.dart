import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color? textColor;
  final TextAlign? textAlign;
  const CustomText({
    super.key,
    required this.text,
    this.fontSize = 16.0,
    this.fontWeight = FontWeight.normal,
    this.textColor,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: textColor,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
      textAlign: textAlign,
    );
  }
}
