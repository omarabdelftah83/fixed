import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webbing_fixed/core/app_text/AppText.dart';
import 'package:webbing_fixed/core/custom_button/custom_buttom.dart';
import 'package:webbing_fixed/core/route/routes.dart';
import 'package:webbing_fixed/feature_admin/home/controll/home_cubit.dart';
import 'package:webbing_fixed/feature_admin/home/controll/home_state.dart';
import 'package:webbing_fixed/feature_admin/home/widget/finish_service.dart';
import 'package:webbing_fixed/helpers/cache_helper.dart';

class UpdateSallary extends StatelessWidget {
  UpdateSallary({super.key, required this.notificationId});
  final int notificationId;  // Add this to accept the notification id

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
                child: BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    final cubit = BlocProvider.of<HomeCubit>(context);

                    return Column(
                      children: [
                        CustomText(
                          text: 'تعديل السعر',
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(height: 10),
                        Align(
                          alignment: Alignment.topRight,
                          child: CustomText(
                            text:
                                '${cubit.updatePriceController.text} : السعر الجديد ',
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 10),
                        // Align(
                        //   alignment: Alignment.topRight,
                        //   child: CustomText(
                        //     text: '40 : وقت وصول العميل بعد',
                        //     fontSize: 18.sp,
                        //     fontWeight: FontWeight.w500,
                        //   ),
                        // ),
                        SizedBox(height: 30),
                        TextField(
                          controller: cubit.updatePriceController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: 'أدخل السعر الجديد',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        CustomButton(
                          textColor: Colors.white,
                          onPressed: () async {
                            print("Fetched orderIdString: $notificationId");

                            if (notificationId == null) {
                              print("فشل تحويل orderId إلى int");
                              return;
                            }

                            // Proceed with valid orderId
                            cubit.updatePrice(context, notificationId);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FinishService(notificationId: notificationId,),
                              ),
                            );

                          },
                          text: 'ارسال',
                          height: 40.h,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
