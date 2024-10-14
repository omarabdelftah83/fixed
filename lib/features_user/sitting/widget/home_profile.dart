import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // تأكد من استيراد BlocProvider و BlocBuilder
import 'package:webbing_fixed/core/text_failed/drop_down_custom_textfailed.dart';
import 'package:webbing_fixed/feature_admin/home/controll/home_cubit.dart';
import 'package:webbing_fixed/feature_admin/home/controll/home_state.dart';
import 'package:webbing_fixed/features_user/sitting/setting_export.dart';

class HomeProfile extends StatefulWidget {
  const HomeProfile({super.key});

  @override
  State<HomeProfile> createState() => _HomeProfileState();
}

class _HomeProfileState extends State<HomeProfile> {
  @override
  void initState() {
    super.initState();
    final cubit = BlocProvider.of<ProfileCubit>(context);
    cubit.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    final profileCubit = BlocProvider.of<ProfileCubit>(context);
    return Scaffold(
      appBar: CustomAppBar(),
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProfileDataLoaded) {
            final user = state.users.isNotEmpty ? state.users[0] : null;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (user != null) ...[
                    const Center(
                      child: CustomText(
                        textColor: Color(0XFF8D8383),
                        text: 'الملف الشخصي ',
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 30.h),

                    DropDownCustomTextfailed(
                      suffixIcon: const Icon(
                        Icons.person,
                        color: Colors.blue,
                      ),
                      hintText: 'اسم المستخدم: ${user.username ?? 'غير متوفر'}',
                    ),
                    SizedBox(height: 30.h),

                    DropDownCustomTextfailed(
                      suffixIcon: const Icon(
                        Icons.email,
                        color: Colors.blue,
                      ),
                      hintText: 'البريد الإلكتروني: ${user.email ?? 'غير متوفر'}',
                    ),
                    SizedBox(height: 20.h),

                    DropDownCustomTextfailed(
                      suffixIcon: const Icon(
                        Icons.phone,
                        color: Colors.blue,
                      ),
                      hintText: 'رقم الهاتف: ${user.phone ?? 'غير متوفر'}',
                    ),
                    SizedBox(height: 20.h),

                    DropDownCustomTextfailed(
                      suffixIcon: const Icon(
                        Icons.location_on,
                        color: Colors.blue,
                      ),
                      hintText: 'الموقع: ${user.location ?? 'غير متوفر'}',
                    ),
                    SizedBox(height: 20.h),

                    DropDownCustomTextfailed(
                      suffixIcon: const Icon(
                        Icons.language,
                        color: Colors.blue,
                      ),
                      hintText: 'البلد: ${user.country ?? 'غير متوفر'}',
                    ),
                    SizedBox(height: 20.h),

                    DropDownCustomTextfailed(
                      suffixIcon: const Icon(
                        Icons.language,
                        color: Colors.blue,
                      ),
                      hintText: 'اللغة: ${user.lan ?? 'غير متوفر'}',
                    ),
                  ],
                ],
              ),
            );
          } else if (state is ProfileError) {
            return Center(child: Text(state.message));
          }
          return const SizedBox(); // يمكنك أيضًا إضافة رسالة افتراضية هنا
        },
      ),
    );
  }
}
