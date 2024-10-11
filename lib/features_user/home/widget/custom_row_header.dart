import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:webbing_fixed/core/route/routes.dart';
import 'package:webbing_fixed/features_user/home/screen/notification_page_user.dart';

import '../home_export.dart';

class CustomRow extends StatelessWidget {
  final String leftIconPath1;
  final String leftIconPath2;
  final String? rightIconPath;
  final String? text;
  final Color iconColor;
  final double iconSize;
  final double textSize;

  const CustomRow({
    Key? key,
    required this.leftIconPath1,
    required this.leftIconPath2,
    this.rightIconPath,
    this.text,
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
        Row(
          children: [
            InkWell(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NotificationPageUser(),

                  ),
                ).then((value) {
                  final cubit = BlocProvider.of<HomeUserCubit>(context);
                  cubit.fetchServices();
                  cubit.fetchBestOffer();
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  leftIconPath2,
                  width: iconSize,
                  height: iconSize,
                  color: iconColor,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                leftIconPath1,
                width: iconSize,
                height: iconSize,
                color: iconColor,
              ),
            ),
          ],
        ),

        // Right side containing text and icon
        Row(
          children: <Widget>[
            Text(
              text ?? '',
              style: TextStyle(
                fontSize: textSize,
                fontWeight: FontWeight.w400,
                color: iconColor,
              ),
            ),
            const SizedBox(width: 8.0),
            rightIconPath != null && rightIconPath!.isNotEmpty
                ? SvgPicture.asset(
              rightIconPath!,
              width: iconSize,
              height: iconSize,
              color: iconColor,
            )
                : const SizedBox(),
          ],
        ),
      ],
    );
  }
}
