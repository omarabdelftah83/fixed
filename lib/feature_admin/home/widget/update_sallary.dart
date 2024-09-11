import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webbing_fixed/core/app_text/AppText.dart';
import 'package:webbing_fixed/core/custom_button/custom_buttom.dart';
import 'package:webbing_fixed/core/route/routes.dart';

class UpdateSallary extends StatelessWidget {
  const UpdateSallary({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            bottom: 20.0,
            left: 20.0,
            right: 20.0,
            child: Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(color: Colors.grey, width: 0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    CustomText(
                        text: 'تعديل السعر',
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.topRight,
                      child: CustomText(
                          text: '10 : السعر المعروض  ',
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.topRight,
                      child: CustomText(
                          text: '40  : وقت وصول العميل بعد  ',
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 30),
                    CustomButton(
                      textColor: Colors.white,
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.finishService);
                      },
                      text: 'ارسال ',
                      height: 40.h,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
