import 'package:flutter/material.dart';
import 'package:webbing_fixed/core/app_text/AppText.dart';
import 'package:webbing_fixed/core/custom_button/custom_buttom.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void showAlertDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32.0.r),
          side: const BorderSide(width: 0),
        ),
        title: Center(
          child: CustomText(
            text: 'الغاء',
            fontSize: 30.sp,
          ),
        ),
        content: Container(
          width: 400.w,
          height: 120.h,
          padding: EdgeInsets.all(10.w),
          child: contentText(),
        ),
        actions: <Widget>[
          Center(
            child: CustomButton(
              height: 30.h,
              width: 160.w,
              borderColor: Colors.red,
              textColor: Colors.red,
              color: Colors.white,
              onPressed: () {
                Navigator.of(context).pop();
              },
              text: 'الغاء',
            ),
          ),
        ],
      );
    },
  );
}

Widget contentText() {
  return const SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        CustomText(
          text: 'هل تريد الغاء الموعد ؟',
          fontSize: 25,
        ),
        CustomText(
          text:
          'اذا حذفت الموعد قبلها ب ساعه سيتم\n تطبيق غرامة قدرها 50 جنيه مصري ',
          fontSize: 15,
          textColor: Colors.grey,
        ),
      ],
    ),
  );
}
