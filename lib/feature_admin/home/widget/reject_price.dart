 import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webbing_fixed/core/app_text/AppText.dart';
import 'package:webbing_fixed/core/custom_button/custom_buttom.dart';
import 'package:webbing_fixed/core/route/routes.dart';
import 'package:webbing_fixed/feature_admin/home/widget/update_sallary.dart';

class RejectPrice extends StatelessWidget {
  final int notificationId;  // Add this to accept the notification id

   RejectPrice({Key? key, required this.notificationId}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Scaffold(body: Stack(
      children: [
        // Remove the old card or list of orders
        Positioned(
          bottom: 20.0, // Position the card at the bottom
          left: 20.0,
          right: 20.0,
          child: Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(color: Colors.grey, width: 0.1),
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
                        text: 'تم رفض السعر من قبل العميل',
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.topRight,
                    child: CustomText(
                        text: 'ملاحظة : السعر غير شامل الخامات',
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: CustomButton(
                          borderColor: Colors.red,
                          textColor: Colors.red,
                          color: Colors.white,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          text: 'رفض',
                          width: 152.w,
                          height: 32.h,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: CustomButton(
                          textColor: Colors.white,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => UpdateSallary(notificationId: notificationId,),
                              ),
                            );
                         //   Navigator.pushNamed(context, Routes.updateSallary);






                          },
                          text: 'عرض سعر اقل',
                          width: 150.w,
                          height: 32.h,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ),);
  }
}
