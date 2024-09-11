import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webbing_fixed/core/app_text/AppText.dart';
import 'package:webbing_fixed/core/custom_button/custom_buttom.dart';
import 'package:webbing_fixed/core/text_failed/custom_text_failed.dart';
import 'package:webbing_fixed/core/widget/custom_app_padding.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaddingApp(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back),
                  ),
                  const CustomText(
                    text: 'تفاصيل الطلب ',
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
              const SizedBox(height: 15),
              const CustomText(text: 'الاسم : محمد اشرف'),
              const SizedBox(height: 15),
              const CustomText(text: 'الخدمة : تصليح مكيف '),
              const SizedBox(height: 15),
              const CustomText(text: 'نوع الوحدة : شباك '),
              const SizedBox(height: 15),
              const CustomText(text: 'عدد الوحدات : واحد فقط'),
              const SizedBox(height: 15),
              const CustomText(text: 'اليوم - 6 مساء '),
              const SizedBox(height: 15),
              const CustomText(text: 'المسافة: 100 متر'),
              const SizedBox(height: 15),
              const CustomText(text: ': صوره'),
              const SizedBox(height: 10),
              Container(
                width: 300.w,
                height: 200.h,
                child: Image.asset('assets/image/unsplash_OGV99Jhhvro.png'),
              ),
              const CustomText(text: 'وصف الخدمة\nالمكيف لايعمل'),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CustomButton(
                      borderColor: Colors.red,
                      textColor: Colors.red,
                      color: Colors.white,
                      onPressed: () {},
                      text: 'رفض',
                      width: 160.w,
                      height: 40.h,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: CustomButton(
                      textColor: Colors.white,
                      onPressed: () => _showOrderDialog(context),
                      text: 'قبول وتحديد سعر',
                      width: 160.w,
                      height: 40.h,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showOrderDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            side: BorderSide(
              color: Colors.grey,
              width: 1,
            ),
          ),
          title: const Center(child: CustomText(text: 'تحديد السعر')),
          content: Container(
            height: 150.h,
            width: 300.w,
            child: const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomText(
                  textColor: Colors.grey,
                  text: 'ملاحظة : السعر غير شامل الخامات',
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
                SizedBox(height: 20),
                CustomTextField(height: 50),
              ],
            ),
          ),
          actions: [
            Center(
              child: CustomButton(
                width: 160.w,
                height: 30.h,
                onPressed: () {
                  Navigator.of(context).pop();
                },
                text: 'تأكيد',
              ),
            ),
          ],
        );
      },
    );
  }
}
