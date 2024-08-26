import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';


class SvgIconWidget extends StatelessWidget {
  final String iconPath;
  final double width;
  final double height;
  final Color? color;

  const SvgIconWidget({super.key,
    required this.iconPath,
    this.width = 24.0,
    this.height = 24.0,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      iconPath,
      width: width,
      height: height,
      color: color,
    );
  }
}