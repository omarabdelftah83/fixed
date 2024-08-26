import 'package:flutter/material.dart';
import 'package:webbing_fixed/core/app_text/AppText.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const CustomElevatedButton({
    required this.onPressed,
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFB9C0C9),
        fixedSize: const Size(350, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0), // الزوايا الدائرية
        ),
      ),
      child: Center(
        child: CustomText(
          text: text,
          textColor: Colors.white,
        ),
      ),
    );
  }
}