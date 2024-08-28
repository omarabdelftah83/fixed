import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Ensure to add this package to your pubspec.yaml

class CustomRow extends StatelessWidget {
  final String leftIconPath;
  final String rightIconPath;
  final String text;
  final Color iconColor;
  final double iconSize;
  final double textSize;

  const CustomRow({
    Key? key,
    required this.leftIconPath,
    required this.rightIconPath,
    required this.text,
    this.iconColor = Colors.black,
    this.iconSize = 24.0,
    this.textSize = 15.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        // Left icon
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(
            leftIconPath,
            width: iconSize,
            height: iconSize,
            color: iconColor,
          ),
        ),

        // Right side containing text and icon
        Row(
          children: <Widget>[
            Text(
              text,
              style: TextStyle(
                fontSize: textSize,
                fontWeight: FontWeight.w400,
                color: iconColor,
              ),
            ),
            SizedBox(width: 8.0),
            SvgPicture.asset(
              rightIconPath,
              width: iconSize,
              height: iconSize,
              color: iconColor,
            ),
          ],
        ),
      ],
    );
  }
}