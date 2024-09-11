import 'package:flutter/material.dart';
import 'package:webbing_fixed/core/app_text/AppText.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final double? width;
  final double? height;
  final Color? color;
  final Color? textColor;
  final Color? borderColor;

  const CustomButton({
    required this.onPressed,
    required this.text,
    this.width,
    this.height,
    this.color,
    this.textColor,
    this.borderColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? const Color(0xFF3EBBDD),
        fixedSize: Size(
          width ?? screenWidth * 0.8,
          height ?? 50,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
          side: BorderSide(
            color: borderColor ?? Colors.transparent,
            width: .5,
          ),
        ),
        elevation: 0.0,
      ),
      child: Center(
        child: CustomText(
          text: text,
          textColor: textColor ?? Colors.white,
        ),
      ),
    );
  }
}
