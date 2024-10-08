import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webbing_fixed/core/app_text/AppText.dart';
import 'package:webbing_fixed/core/custom_button/custom_buttom.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webbing_fixed/features_user/home/controll/home_user_cubit.dart';
import 'package:webbing_fixed/features_user/order/controll/orders_cubit.dart';
import 'package:webbing_fixed/features_user/order/widget/review_page.dart';

class OrderCard extends StatelessWidget {
  final String? name;
  final String? service;
  final String? date;
  final String? imagePath;
  final String? status;
  final int? idProvider; // Add idProvider field
final int? id ;
  const OrderCard({
    super.key,
    this.name,
    this.service,
    this.date,
    this.imagePath,
    this.status,
    this.idProvider,
    this.id
    // Make idProvider required
  });

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<OrdersUserCubit>(context); // Initialize cubit here

    return Card(
      color: Colors.white,
      margin: EdgeInsets.all(10.w),
      child: Padding(
        padding: EdgeInsets.all(10.w),
        child: Row(
          children: [
            if (status == 'القادم')
              GestureDetector(
                onTap: () {
                  _showAlertDialog(context, cubit); // Pass cubit as parameter
                },
                child: CustomText(
                  text: '(الغاء)',
                  fontSize: 15.sp,
                  textColor: Colors.red,
                ),
              ),
            if (status == 'مكتملة' || status == 'ملغية')
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ReviewPageUser(idProvider: idProvider ?? 0),
                    ),
                  );
                },
                child: CustomText(
                  text: '(قيم الفني)',
                  fontSize: 15.sp,
                  textColor: Colors.blue,
                ),
              ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('الاسم: ${name ?? 'غير متوفر'}',
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold)),
                  Text('الخدمة: ${service ?? 'غير متوفر'}',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.grey,
                      )),
                  Text(date ?? 'غير متوفر',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.grey,
                      )),
                  if (status == 'القادم')
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
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
              height: 90.h,
              color: Colors.grey.shade400,
            ),
            CircleAvatar(
              backgroundImage: AssetImage(imagePath ?? 'assets/default_image.png'),
              radius: 30.w,
            ),
          ],
        ),
      ),
    );
  }

  void _showAlertDialog(BuildContext context, OrdersUserCubit cubit) { // Add cubit parameter
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
                  if (id != null) { // Check if idProvider is not null
                    cubit.cancelOrder(id!); // Use idProvider
                  }
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
}
