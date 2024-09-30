import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webbing_fixed/core/app_text/AppText.dart';
import 'package:webbing_fixed/core/custom_button/custom_buttom.dart';
import 'package:webbing_fixed/core/text_failed/custom_text_failed.dart';
import 'package:webbing_fixed/core/widget/custom_app_padding.dart';
import 'package:webbing_fixed/feature_admin/home/model/get_all_order_model.dart'; // تأكد من استيراد النموذج المناسب

class OrderDetails extends StatelessWidget {
  final GetOrderModel order;

  const OrderDetails({super.key, required this.order});

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
              CustomText(text: 'الاسم : ${order.name}'),
              const SizedBox(height: 15),
              CustomText(text: 'الخدمة : ${order.serviceName}'),
              const SizedBox(height: 15),
              CustomText(text: 'نوع الوحدة : ${order.typeService}'),
              const SizedBox(height: 15),
              CustomText(text: 'عدد الوحدات : ${order.count}'),
              const SizedBox(height: 15),
              CustomText(text: 'اليوم - ${order.time}'),
              const SizedBox(height: 15),
              CustomText(text: 'المسافة: ${order.location}'),
              const SizedBox(height: 15),
              const CustomText(text: ': صوره'),
              const SizedBox(height: 10),
              Container(
                width: 150.w,
                height: 150.h,
                child: order.file != null ? Image.network('http://194.164.77.238${order.file}') : Container(), // Empty container if no file is provided
              ),
              CustomText(text: 'وصف الخدمة\n${order.description}'),
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
                      onPressed: () => showOrderDialog(context),
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

  void showOrderDialog(BuildContext context) {
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
