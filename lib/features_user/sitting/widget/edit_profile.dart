import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:webbing_fixed/features_user/sitting/setting_export.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final profileCubit = BlocProvider.of<ProfileCubit>(context);
    return Scaffold(
      appBar: CustomAppBar(),
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          size: 15,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: CustomText(
                          text: 'Edit Profile'.tr(),
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w400,
                          textColor: Colors.grey,
                        ),
                      ),
                      const SizedBox(width: 10),
                      const PickImageWidget(),
                    ],
                  ),
                  Column(
                    children: [
                      const SizedBox(height: 10),
                       Align(
                        alignment: Alignment.topRight,
                        child: CustomText(
                          text: 'Name'.tr(),
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        keyboardType: TextInputType.name,
                        controller: profileCubit.nameController,
                      ),
                      const SizedBox(height: 10),
                       Align(
                        alignment: Alignment.topRight,
                        child: CustomText(
                          text: 'Phone Number'.tr(),
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        keyboardType: TextInputType.phone,
                        controller: profileCubit.phoneController,
                      ),
                      const SizedBox(height: 10),
                       Align(
                        alignment: Alignment.topRight,
                        child: CustomText(
                          text: 'Address'.tr(),
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        keyboardType: TextInputType.text,
                        controller: profileCubit.locationController,
                      ),
                      const SizedBox(height: 30),
                      CustomButton(
                        onPressed: () async {
                          await profileCubit.updateUser(context);
                        },
                        text: 'Edit'.tr(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
