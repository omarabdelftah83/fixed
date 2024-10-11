import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webbing_fixed/core/shimmer/shimmer_loading.dart';
import 'package:webbing_fixed/feature_admin/home/controll/home_cubit.dart';
import 'package:webbing_fixed/feature_admin/home/controll/home_state.dart';
import 'package:webbing_fixed/feature_admin/home/home_export.dart';
import 'package:webbing_fixed/feature_admin/home/widget/notification_page_admin.dart';
import 'package:webbing_fixed/feature_admin/home/widget/service_cared.dart';

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
    cubit.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaddingApp(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BlocBuilder<HomeCubit, HomeState>(
                    builder: (context, state) {
                      if (state is HomeDataLoaded) {
                        final user = state.users.isNotEmpty ? state.users[0] : null;
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.start, // تعديل الاتجاه
                          children: [
                            CircleAvatar(
                              radius: 20.w,
                            ),
                            SizedBox(width: 20.w),
                            if (user != null)
                              CustomText(
                                text: ' مرحبا ${user.username}', // تعديل النص
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                              ),

                          ],
                        );
                      } else if (state is HomeErrorState) {
                        return Text(state.errorMessage);
                      }
                      return const SizedBox();
                    },
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const NotificationPageAdmin(),

                            ),
                          ).then((value) {
                            final cubit = BlocProvider.of<HomeCubit>(context);
                            cubit.fetchData();
                          });
                        },
                        child: const SvgIconWidget(iconPath: AssetsManager.notification),
                      ),

                      SizedBox(width: 10.w),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, Routes.walletPage);
                        },
                        child: const SvgIconWidget(iconPath: AssetsManager.iconWallet),
                      ),

                    ],
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start, // تعديل الاتجاه
                    children: [
                      CustomText(text: 'set_location'.tr()),
                      const SvgIconWidget(iconPath: AssetsManager.iconLocation)
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start, // تعديل الاتجاه
                    children: [
                      CustomText(
                        text: 'reject_price'.tr(),
                        fontSize: 12.sp,
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.pushNamed(context, Routes.rejectPrice);
                          },
                          icon: const Icon(Icons.arrow_forward_ios)),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              CustomSwitch(
                value: true,
                text: 'status_ready'.tr(),
                onChanged: (value) {},
              ),
              SizedBox(height: 20.h),
              CustomText(
                text: 'offered_services'.tr(),
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              SizedBox(height: 20.h),
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  if (state is HomeLoading) {
                    return const ShimmerLoading();
                  } else if (state is HomeDataLoaded) {
                    final services = state.services;
                    return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: services.length,
                      itemBuilder: (context, index) {
                        final service = services[index];
                        return ServiceCard(service: service);
                      },
                    );
                  } else if (state is HomeErrorState) {
                    return Center(child: Text(state.errorMessage));
                  }
                  return const SizedBox();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
