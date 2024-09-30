import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webbing_fixed/feature_admin/home/home_export.dart';
import 'package:webbing_fixed/feature_admin/home/model/get_all_order_model.dart';

class ServiceCard extends StatelessWidget {
  final GetOrderModel service;

  const ServiceCard({Key? key, required this.service}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10.h),
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            CustomText(
              text: 'الاسم : ${service.name}',
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: 10.h),
            CustomText(
              text: 'الخدمة : ${service.serviceName}',
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
            SizedBox(height: 10.h),
            CustomText(
              textColor: Colors.blue,
              text: 'اليوم - ${service.time}',
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
            SizedBox(height: 30.h),
            CustomButton(
              onPressed: () {
                Navigator.pushNamed(
                    context, Routes.orderDetails,
                    arguments: service);
              },
              text: 'المزيد',
              width: 160.w,
              height: 30.h,
            ),
          ],
        ),
      ),
    );
  }
}
