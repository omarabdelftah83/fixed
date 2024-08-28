import 'package:flutter/material.dart';
import 'package:webbing_fixed/core/SvgIcon/custom_svg_icon.dart';
import 'package:webbing_fixed/core/app_text/AppText.dart';
import 'package:webbing_fixed/core/resource/assets_manager.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: (){
          },
          child: Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
            elevation: 2.0,
            child: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 80.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Your Text Here',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CustomText(
                              text: 'احمد السالم',
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                            SizedBox(width: 8.0),
                            SvgIconWidget(
                              iconPath: AssetsManager.iconWallet ?? '', // Ensure this is not null
                              width: 30,
                              height: 30,
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 55.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              CustomText(
                                text: '4.5',
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              SvgIconWidget(
                                iconPath: AssetsManager.iconStart ?? '', // Ensure this is not null
                                width: 20,
                                height: 20,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          left: 2,
          top: 2,
          child: Container(
            width: 120.0,
            height: 40.0,
            decoration: const BoxDecoration(
              color: Color(0xFF8D8383),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
              ),
            ),
            child: const Center(
              child: CustomText(
                text: 'افضل',
                fontSize: 12,
              ),
            ),
          ),
        ),
      ],
    );
  }
}