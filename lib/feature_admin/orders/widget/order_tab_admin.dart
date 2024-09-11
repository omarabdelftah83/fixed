import 'package:flutter/material.dart';
import 'package:webbing_fixed/core/App_assets/app_assets.dart';
import 'package:webbing_fixed/feature_admin/orders/widget/dialog.dart';
import 'package:webbing_fixed/features_user/order/widget/ordercard.dart';
import 'package:flutter/material.dart';
import 'package:webbing_fixed/core/app_text/AppText.dart';
import 'package:webbing_fixed/core/custom_button/custom_buttom.dart';
import 'package:webbing_fixed/core/route/routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrdersTabAdmin extends StatelessWidget {
  final String orderStatus;

  const OrdersTabAdmin({super.key, required this.orderStatus});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        OrderCardAdmin(
          name: 'احمد السالم',
          service: 'تصليح مكيفات',
          date: 'اليوم - 6 مساء',
          imagePath: AppAssets.thePerson,
          status: orderStatus,
        ),
      ],
    );
  }
}


class OrderCardAdmin extends StatelessWidget {
  final String name;
  final String service;
  final String date;
  final String imagePath;
  final String status;

  const OrderCardAdmin({
    super.key,
    required this.name,
    required this.service,
    required this.date,
    required this.imagePath,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.all(20.w),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.grey, width: 0.1), // الـ border
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: EdgeInsets.all(10.w),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('الاسم: $name',
                          style: TextStyle(
                              fontSize: 16.sp, fontWeight: FontWeight.bold)),
                      Text('الخدمة: $service',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.grey,
                          )),
                      Text('الجيزة 5 كم',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.grey,
                          )),
                      if (status == 'القادم')
                        Text(
                          date,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.blue,
                          ),
                        ),
                      if (status == 'مكتملة' || status == 'ملغية')
                        Text('15/7/2024 ',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.grey,
                            )),
                      if (status == 'مكتملة' || status == 'ملغية')
                        Text('تم  تحصيل 50 جنيه ',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.green,
                            )),
                      if (status == 'القادم')
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                                icon: Icon(
                                  Icons.location_on,
                                  color: Colors.blue,
                                  size: 20.w,
                                ),
                                onPressed: () {}),
                            IconButton(
                                icon: Icon(
                                  Icons.call,
                                  color: Colors.blue,
                                  size: 20.w,
                                ),
                                onPressed: () {}),
                            IconButton(
                                icon: Icon(
                                  Icons.mail_outline,
                                  color: Colors.blue,
                                  size: 20.w,
                                ),
                                onPressed: () {}),
                          ],
                        ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10.w),
                  width: 1.w,
                  height: 160.h,
                  color: Colors.grey.shade400,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 0.2),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  width: 100.w,
                  height: 70.h,
                  child: Image.asset(imagePath, fit: BoxFit.fill),
                ),
              ],
            ),
            if (status == 'القادم')
              GestureDetector(
                onTap: () {
                  showAlertDialog(context);
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0, right: 250),
                  child: CustomText(
                    text: '(حذف)',
                    fontSize: 15.sp,
                    textColor: Colors.red,
                  ),
                ),
              ),
            if (status == 'مكتملة' || status == 'ملغية')
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, Routes.reviewPage);
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0, right: 250),
                  child: CustomText(
                    text: '(قيم الفني)',
                    fontSize: 15.sp,
                    textColor: Colors.blue,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}