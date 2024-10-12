import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webbing_fixed/core/SvgIcon/custom_svg_icon.dart';
import 'package:webbing_fixed/core/app_text/AppText.dart';
import 'package:webbing_fixed/core/resource/assets_manager.dart';
import 'package:webbing_fixed/core/route/routes.dart';
import 'package:webbing_fixed/core/shimmer/shimmer_loading.dart';
import 'package:webbing_fixed/core/widget/custom_app_padding.dart';
import 'package:webbing_fixed/feature_admin/home/controll/home_cubit.dart';
import 'package:webbing_fixed/feature_admin/home/controll/home_state.dart';
import 'package:webbing_fixed/feature_admin/home/widget/reject_price.dart';

class NotificationPageAdmin extends StatefulWidget {
  const NotificationPageAdmin({super.key});

  @override
  State<NotificationPageAdmin> createState() => _NotificationPageAdminState();
}

class _NotificationPageAdminState extends State<NotificationPageAdmin> {
  @override
  void initState() {
    super.initState();
    final cubit = BlocProvider.of<HomeCubit>(context);
    cubit.getNotificationAdmin();
  }

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
                ),
              ),
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  if (state is HomeLoading) {
                    return const ShimmerLoading();
                  } else if (state is NotificationAdminLoaded) {
                    final notifications = state.notifications;

                    return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: notifications.length,
                      itemBuilder: (context, index) {
                        final notification = notifications[index];

                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RejectPrice(notificationId: notification.idOffer),
                              ),
                            );

                          },
                          child: Card(
                            margin: EdgeInsets.symmetric(vertical: 10.h),
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(color: Colors.red, width: 0.5),
                              borderRadius: BorderRadius.circular(15.r),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(16.w),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        CustomText(
                                          text: notification.title,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        SizedBox(height: 8.h),
                                        CustomText(
                                          textColor: Colors.grey,
                                          text: notification.content,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ],
                                    ),
                                  ),
                                  IconButton(
                                    icon: SvgIconWidget(
                                      iconPath: AssetsManager.iconDelete,
                                      width: 24.w,
                                      height: 24.h,
                                    ),
                                    onPressed: () {
                                      final cubit = BlocProvider.of<HomeCubit>(context);
                                      cubit.deleteNotificationAdmin(notification.id);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  } else if (state is HomeErrorState) {
                    return Center(child: Text(state.errorMessage));
                  }
                  return Center(child: Text('لا يوجد اشعارات '));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
