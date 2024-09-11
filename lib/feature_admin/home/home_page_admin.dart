import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webbing_fixed/core/SvgIcon/custom_svg_icon.dart';
import 'package:webbing_fixed/core/app_text/AppText.dart';
import 'package:webbing_fixed/core/custom_button/custom_buttom.dart';
import 'package:webbing_fixed/core/resource/assets_manager.dart';
import 'package:webbing_fixed/core/widget/custom_app_padding.dart';
import 'package:webbing_fixed/features_user/onboarding/screen/on_boarding_export.dart';
import 'package:webbing_fixed/features_user/sitting/widget/custom_switch.dart';

class HomePageAdmin extends StatelessWidget {
  const HomePageAdmin({super.key});

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
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context,
                              Routes.walletPage); // Navigate to wallet page
                        },
                        child: const SvgIconWidget(
                            iconPath: AssetsManager.iconWallet),
                      ),
                      SizedBox(width: 10.w),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                              context,
                              Routes
                                  .notificationPage); // Navigate to notifications page
                        },
                        child: const SvgIconWidget(
                            iconPath: AssetsManager.notification),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomText(
                        text: 'مرحبا! احمد',
                        fontSize: 16.sp, // Adjust font size using ScreenUtil
                        fontWeight: FontWeight.w500,
                      ),
                      SizedBox(width: 20.w), // Adjust spacing using ScreenUtil
                      CircleAvatar(
                        radius: 20.w, // Adjust avatar size using ScreenUtil
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              // Adjust vertical spacing using ScreenUtil
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                       CustomText(
                        text: 'رفض السعر من العميل  ', fontSize: 12.sp,),

                      IconButton(
                          onPressed: () {
                            Navigator.pushNamed(context, Routes.rejectPrice);
                          }, icon: const Icon(Icons.arrow_forward_ios)),
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomText(text: 'حدد موقعك'),
                      SvgIconWidget(iconPath: AssetsManager.iconLocation)
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              CustomSwitch(
                value: true,
                text: 'الحالة : جاهز لاستقبال الطلبات',
                onChanged: (value) {},
              ),
              SizedBox(height: 20.h),
              const CustomText(
                text: 'الخدمات المعروضة',
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              SizedBox(height: 20.h),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 10.h),
                    // Use ScreenUtil for margin
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          15.r), // Use ScreenUtil for radius
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(16.w),
                      // Use ScreenUtil for padding
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const CustomText(
                            text: ': الاسم ',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(height: 10.h),
                          const CustomText(
                            text: ': الخدمة ',
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          SizedBox(height: 10.h),
                          const CustomText(
                            textColor: Colors.blue,
                            text: ': اليوم - 6 مساء ',
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          SizedBox(height: 30.h),
                          CustomButton(
                            onPressed: () {
                              Navigator.pushNamed(context, Routes.orderDetails);
                            },
                            text: 'المزيد',
                            width: 160.w, // Use ScreenUtil for button width
                            height: 30.h, // Use ScreenUtil for button height
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
