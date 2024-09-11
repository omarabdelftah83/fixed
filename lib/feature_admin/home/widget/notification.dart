import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webbing_fixed/core/SvgIcon/custom_svg_icon.dart';
import 'package:webbing_fixed/core/app_text/AppText.dart';
import 'package:webbing_fixed/core/resource/assets_manager.dart';
import 'package:webbing_fixed/core/widget/custom_app_padding.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaddingApp(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Center(
                  child: CustomText(
                    text: 'الاشعارات',
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  )),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 10.h),
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Colors.red, width: 0.5),
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(16.w),
                      child: Row(
                        children: [
                          SvgIconWidget(
                            iconPath: AssetsManager.iconDelete,
                            width: 24.w, // Example width
                            height: 24.h, // Example height
                          ),
                          SizedBox(width: 60.w), // Adjust spacing

                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const CustomText(
                                  text: 'تم تاكيد طلبك من قبل عميل ',
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                SizedBox(height: 8.h), // Adjust spacing
                                const CustomText(
                                  textColor: Colors.grey,
                                  text: 'انقر للذهاب لصفحة الطلبات القادمة ',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ],
                            ),
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
