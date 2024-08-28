import 'package:flutter/material.dart';
import 'package:webbing_fixed/core/SvgIcon/custom_svg_icon.dart';
import 'package:webbing_fixed/core/app_text/AppText.dart';
import 'package:webbing_fixed/core/custom_button/custom_buttom.dart';
import 'package:webbing_fixed/core/resource/assets_manager.dart';

class CustomCardSplash extends StatelessWidget {
  const CustomCardSplash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        InkWell(
          onTap: () {},
          child: SizedBox(
            height: screenHeight * 0.39,
            width: screenWidth * 2.2,
            child: Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ),
              elevation: 2.0,
              child: Padding(
                padding: EdgeInsets.all(screenWidth * 0.04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(width: screenWidth * 0.1),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              CustomText(
                                text: '250 ج.م',
                                fontSize: screenWidth * 0.06,
                                fontWeight: FontWeight.w600,
                              ),
                              CustomText(
                                text: 'الاحد 14 يوليو, 09:00',
                                fontSize: screenWidth * 0.04,
                                fontWeight: FontWeight.w500,
                              ),
                              SizedBox(height: screenHeight * 0.01),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  CustomText(
                                    text: 'احمد السالم',
                                    fontSize: screenWidth * 0.035,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  SizedBox(width: screenWidth * 0.02),
                                  CircleAvatar(
                                    radius: screenWidth * 0.05,
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: screenWidth * 0.15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    CustomText(
                                      text: '4.5',
                                      fontSize: screenWidth * 0.035,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    SizedBox(width: screenWidth * 0.02),
                                    SvgIconWidget(
                                      iconPath: AssetsManager.iconStart ?? '',
                                      width: screenWidth * 0.05,
                                      height: screenWidth * 0.05,
                                    ),
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: CustomButton(
                            borderColor: Colors.blue,
                            textColor: Colors.blue,
                            color: Colors.white,
                            onPressed: () {},
                            text: 'رفض',
                            width: screenWidth * 0.05,
                            height: screenHeight * 0.05,
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.04),
                        Expanded(
                          child: CustomButton(
                            textColor: Colors.white,
                            onPressed: () {},
                            text: 'قبول',
                            width: screenWidth * 0.05,
                            height: screenHeight * 0.05,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          left: screenWidth * 0.02,
          top: screenHeight * 0.02,
          child: Container(
            width: screenWidth * 0.4,
            height: screenHeight * 0.06,
            decoration: const BoxDecoration(
              color: Color(0xFF3EBBDD),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
              ),
            ),
            child: const Center(
              child: CustomText(
                textColor: Colors.white,
                text: 'افضل عرض',
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
