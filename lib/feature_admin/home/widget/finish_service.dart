import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webbing_fixed/core/SvgIcon/custom_svg_icon.dart';
import 'package:webbing_fixed/core/app_text/AppText.dart';
import 'package:webbing_fixed/core/custom_button/custom_buttom.dart';
import 'package:webbing_fixed/core/resource/assets_manager.dart';
import 'package:webbing_fixed/feature_admin/home/controll/home_cubit.dart';
import 'package:webbing_fixed/feature_admin/home/controll/home_state.dart';

class FinishService extends StatelessWidget {
  const FinishService({super.key, required this.notificationId});

  final int notificationId; // Add this to accept the notification id

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
                side: const BorderSide(color: Colors.grey, width: 0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    final cubit = BlocProvider.of<HomeCubit>(context);

                    return Column(
                      children: [
                        CustomText(text:
                        'تم اكتمال الخدمة',
                            fontSize: 18.sp, fontWeight: FontWeight.w500),
                        const SizedBox(height: 30),
                        SizedBox(
                          width: 120.w, // Set width
                          height: 120.h, // Set height
                          child: const SvgIconWidget(
                            iconPath: AssetsManager.happy,
                          ),
                        ),
                        const SizedBox(height: 30),


                        CustomButton(
                          textColor: Colors.white,
                          onPressed: () {
                            if (notificationId == null) {
                              print("فشل تحويل orderId إلى int");
                              return;
                            }
                            cubit.DoneOrderAdmin(context,notificationId);
                          },

                          text: 'تاكيد ',
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
