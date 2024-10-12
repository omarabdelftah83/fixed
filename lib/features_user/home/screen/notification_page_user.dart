import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webbing_fixed/core/SvgIcon/custom_svg_icon.dart';
import 'package:webbing_fixed/core/app_text/AppText.dart';
import 'package:webbing_fixed/core/resource/assets_manager.dart';
import 'package:webbing_fixed/core/shimmer/shimmer_loading.dart';
import 'package:webbing_fixed/core/widget/custom_app_padding.dart';
import 'package:webbing_fixed/features_user/home/controll/home_user_cubit.dart';
import 'package:webbing_fixed/features_user/home/controll/home_user_state.dart';

class NotificationPageUser extends StatefulWidget {
  const NotificationPageUser({super.key});

  @override
  State<NotificationPageUser> createState() => _NotificationPageUserState();
}

class _NotificationPageUserState extends State<NotificationPageUser> {
  @override
  void initState() {
    super.initState();
    final cubit = BlocProvider.of<HomeUserCubit>(context);
    cubit.getNotificationUser();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<HomeUserCubit>(context);

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
                ),
              ),
              BlocBuilder<HomeUserCubit, HomeUserState>(
                builder: (context, state) {
                  if (state is HomeUserLoading) {
                    return const ShimmerLoading();
                  } else if (state is NotificationUserLoaded) {
                    if (state.notifications.isEmpty) {
                      return const Center(
                        child: Column(
                          children: [
                            SizedBox(height: 200,),
                            Text(
                              'لا توجد إشعارات',
                              style: TextStyle(fontSize: 18, color: Colors.grey),
                            ),
                          ],
                        ),
                      );
                    }
                    return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: state.notifications.length,
                      itemBuilder: (context, index) {
                        final notification = state.notifications[index];
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
                                GestureDetector(
                                  onTap: () async {
                                    await cubit.deleteNotificationUser(notification.id); // Call delete
                                    cubit.getNotificationUser(); // Refresh notifications after deletion
                                  },
                                  child: SvgIconWidget(
                                    iconPath: AssetsManager.iconDelete,
                                    width: 24.w,
                                    height: 24.h,
                                  ),
                                ),
                                SizedBox(width: 60.w),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                        text: notification.title, // عرض عنوان الإشعار
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      SizedBox(height: 8.h),
                                      CustomText(
                                        textColor: Colors.grey,
                                        text: notification.content, // عرض محتوى الإشعار
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
                    );
                  } else if (state is HomeUserErrorState) {
                    return Center(child: Text('لا توجد اشعارات حالياً.'));
                  }
                  return Container(); // حاوية فارغة بشكل افتراضي للحالات الأخرى
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
