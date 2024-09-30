import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webbing_fixed/core/app_text/AppText.dart';
import 'package:webbing_fixed/core/route/routes.dart';
import 'package:webbing_fixed/feature_admin/orders/widget/dialog.dart';

class OrderCardAdmin extends StatelessWidget {
  final String? name;
  final String? service;
  final int? count;
  final String? imagePath;
  final String? status;
  final String? location;
  final double? price;
  final String? data;
  final String? dataTime;


  const OrderCardAdmin({
    super.key,
    this.name,
    this.service,
    this.count,
    this.imagePath,
    this.status,
    this.location,
    this.data,
    this.price, this.dataTime,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.all(20.w),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.grey, width: 0.1),
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
                      Text('الاسم: ${name ?? 'غير متاح'}',
                          style: TextStyle(
                              fontSize: 16.sp, fontWeight: FontWeight.bold)),
                      Text('الخدمة: ${service ?? 'غير متاحة'}',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.grey,
                          )),
                      Text(location ?? 'غير متاح',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.grey,
                          )),
                      if (status == 'القادم')
                        Text('  ${count}: العدد  ',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.grey,
                          ),
                        ),
                      if ( status == 'القادم'|| status == 'ملغية' )
                        Text(data ?? 'غير متاح',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.blue,
                            )),
                      if ( status == 'مكتملة' )
                        Text(dataTime ?? 'غير متاح',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.grey,
                            )),
                      if (status == 'مكتملة' )
                        Text('تم تحصيل :$price',
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
                  child: Image.network('http://194.164.77.238$imagePath',
                      fit: BoxFit.fill), // استخدم صورة افتراضية هنا
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
