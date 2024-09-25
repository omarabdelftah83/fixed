import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webbing_fixed/feature_admin/home/controll/home_cubit.dart';
import 'package:webbing_fixed/feature_admin/home/controll/home_state.dart';
import 'package:webbing_fixed/feature_admin/home/home_export.dart';

class HomePageAdmin extends StatefulWidget {
  const HomePageAdmin({super.key});

  @override
  State<HomePageAdmin> createState() => _HomePageAdminState();
}

class _HomePageAdminState extends State<HomePageAdmin> {
  @override
  void initState() {
    super.initState();
    final cubit = BlocProvider.of<HomeCubit>(context);
    cubit.getAllOrder();
  }
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
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  if (state is HomeLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is HomeLoaded) {
                    final services = state.services;
                    return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: services.length,
                      itemBuilder: (context, index) {
                        final service = services[index];
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
                                        context, Routes.orderDetails);
                                  },
                                  text: 'المزيد',
                                  width: 160.w,
                                  height: 30.h,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  } else if (state is HomeErrorState) {
                    return Center(child: Text(state.errorMessage));
                  }
                  return const SizedBox(); // Return empty widget for initial state
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
