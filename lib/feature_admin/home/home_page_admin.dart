import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webbing_fixed/feature_admin/home/controll/home_cubit.dart';
import 'package:webbing_fixed/feature_admin/home/controll/home_state.dart';
import 'package:webbing_fixed/feature_admin/home/home_export.dart';
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
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, Routes.walletPage);
                        },
                        child: const SvgIconWidget(iconPath: AssetsManager.iconWallet),
                      ),
                      SizedBox(width: 10.w),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, Routes.notificationPage);
                        },
                        child: const SvgIconWidget(iconPath: AssetsManager.notification),
                      ),
                    ],
                  ),
                  BlocBuilder<HomeCubit, HomeState>(
                    builder: (context, state) {
                     if (state is HomeDataLoaded) {
                        final user = state.users.isNotEmpty ? state.users[0] : null;
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            if (user != null)
                              CustomText(
                                text: ' ${user.username  } مرحبا ',
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            SizedBox(width: 20.w),
                            CircleAvatar(
                              radius: 20.w,
                             // backgroundImage: AssetImage(AssetsManager.defaultAvatar), // Adjust for default avatar
                            ),
                          ],
                        );
                      } else if (state is HomeErrorState) {
                        return Text(state.errorMessage);
                      }
                      return const SizedBox();
                    },
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomText(
                        text: 'رفض السعر من العميل',
                        fontSize: 12.sp,
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.pushNamed(context, Routes.rejectPrice);
                          },
                          icon: const Icon(Icons.arrow_forward_ios)),
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
