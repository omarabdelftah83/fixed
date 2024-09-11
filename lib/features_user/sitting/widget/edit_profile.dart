import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webbing_fixed/core/custom_button/custom_buttom.dart';
import 'package:webbing_fixed/core/widget/custom_appar.dart';
import 'package:webbing_fixed/features_user/sitting/controll/profile_cubit.dart';
import 'package:webbing_fixed/features_user/sitting/widget/pick_image.dart';
import '../../../../core/app_text/AppText.dart';
import '../../../../core/text_failed/custom_text_failed.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.only(left: 20.0,right: 20.r),
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
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                   Expanded(
                     child: CustomText(
                      text: 'تعديل الملف الشخصي',
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w400,
                      textColor: Colors.grey,
                     
                                       ),
                   ),
                  const SizedBox(
                    width: 10,
                  ),

                  //image!
                  const PickImageWidget(),
                ],
              ),
              Column(
                children: [
                  const SizedBox(height: 10),
                  const Align(
                    alignment: Alignment.topRight,
                    child: CustomText(
                      text: 'الاسم',
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const CustomTextField(
                    keyboardType: TextInputType.name,
                  ),
                  const SizedBox(height: 10),
                  const Align(
                    alignment: Alignment.topRight,
                    child: CustomText(
                      text: 'رقم الهاتف',
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const CustomTextField(
                    keyboardType: TextInputType.phone,
                  ),
                  const SizedBox(height: 10),
                  const Align(
                    alignment: Alignment.topRight,
                    child: CustomText(
                      text: 'رقم اخر',
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const CustomTextField(
                    keyboardType: TextInputType.phone,
                  ),
                  const SizedBox(height: 10),
                  const Align(
                    alignment: Alignment.topRight,
                    child: CustomText(
                      text: 'العنوان',
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const CustomTextField(
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(height: 30),
                  CustomButton(
                    onPressed: () {},
                    text: 'تعديل',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
