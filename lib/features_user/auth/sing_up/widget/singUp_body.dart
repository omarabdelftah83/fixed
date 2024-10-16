import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webbing_fixed/core/App_string/app_string.dart';
import 'package:webbing_fixed/core/app_text/AppText.dart';
import 'package:webbing_fixed/core/custom_button/custom_buttom.dart';
import 'package:webbing_fixed/core/route/routes.dart';
import 'package:webbing_fixed/core/services/service_locator.dart';
import 'package:webbing_fixed/core/text_failed/custom_text_failed.dart';
import 'package:webbing_fixed/features_user/auth/sing_up/controll/sign_up_user_cubit.dart';
import 'package:webbing_fixed/features_user/auth/sing_up/controll/sign_up_user_state.dart';

class SingUpBody extends StatelessWidget {
  const SingUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => serLoc<SignUpUserCubit>(),
      child: BlocBuilder<SignUpUserCubit, SignUpUserState>(
        builder: (context, state) {
          final cubit = BlocProvider.of<SignUpUserCubit>(context);
          return state is SingUpLoading
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      const Center(
                        child: CustomText(
                          text: 'انشاء حساب',
                          fontSize: 24, // Font size does not use .h/.w
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Stack(
                        children: [
                          // Container 1 (Gray)
                          Container(
                            height: 1110.h,
                            margin: EdgeInsets.only(top: 40.h),
                            // Use .h for top margin
                            decoration: const BoxDecoration(
                              color: Color(0xFF3EBBDD),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                            ),
                          ),
                          // Container 2 (White)
                          Positioned(
                            top: 80.h,
                            // Use .h for positioning
                            left: 0.0,
                            right: 0.0,
                            bottom: 10.h,
                            // Use .h for bottom position
                            child: Container(
                              height: 500.h, // Use .h for height
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(40.w),
                                // Use .w for circular radius
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    spreadRadius:
                                        5.w, // Use .w for shadow spread
                                    blurRadius: 7.w, // Use .w for shadow blur
                                    offset: Offset(0, 3.h), // Use .h for offset
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding:
                                    EdgeInsets.all(16.w), // Use .w for padding
                                child: Column(
                                  children: [
                                    SizedBox(
                                        height: 10.h), // Use .h for spacing
                                    const Align(
                                      alignment: Alignment.topRight,
                                      child: CustomText(
                                        text: '* الاسم',
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    SizedBox(height: 10.h),
                                    CustomTextField(
                                      onChanged: cubit.onChangeName,
                                      errorText: cubit.nameError,
                                      controller: cubit.nameController,
                                      keyboardType: TextInputType.name,
                                      hintText: 'مستخدم',
                                    ),
                                    SizedBox(height: 10.h),
                                    const Align(
                                      alignment: Alignment.topRight,
                                      child: CustomText(
                                        text: '* رقم الهاتف',
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    SizedBox(height: 10.h),
                                    CustomTextField(
                                      errorText: cubit.phoneNumberError,
                                      controller: cubit.phoneController,
                                      keyboardType: TextInputType.phone,
                                      onChanged: cubit.onChangePhoneNumber,
                                      hintText: '123456789',
                                    ),
                                    SizedBox(height: 10.h),
                                    const Align(
                                      alignment: Alignment.topRight,
                                      child: CustomText(
                                        text: 'البريد الاكتروني(اختياري)',
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    SizedBox(height: 10.h),
                                    CustomTextField(
                                      errorText: cubit.emailError,
                                      controller: cubit.emailAddressController,
                                      keyboardType: TextInputType.emailAddress,
                                      onChanged: cubit.onChangeEmail,
                                      hintText: 'om@gmail.com',
                                    ),
                                    SizedBox(height: 10.h),
                                    const Align(
                                      alignment: Alignment.topRight,
                                      child: CustomText(
                                        text: '* كلمة المرور',
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    SizedBox(height: 10.h),
                                    CustomTextField(
                                      errorText: cubit.passError,
                                      controller: cubit.passwordController,
                                      hintText: '********',
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                      onChanged: cubit.onChangePass,
                                      isPassword: true,
                                      obscureText: true,
                                    ),
                                    SizedBox(height: 10.h),
                                    const Align(
                                      alignment: Alignment.topRight,
                                      child: CustomText(
                                        text: '* تاكيد كلمة المرور',
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    SizedBox(height: 10.h),
                                    CustomTextField(
                                      errorText: cubit.confirmPasswordError,
                                      controller:
                                          cubit.confirmPasswordController,
                                      hintText: '********',
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                      onChanged: cubit.onChangeConfirmPassword,
                                      isPassword: true,
                                      obscureText: true,
                                    ),
                                    SizedBox(height: 10.h),
                                    const Align(
                                      alignment: Alignment.topRight,
                                      child: CustomText(
                                        text: '* العنوان',
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    SizedBox(height: 10.h),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        const CustomText(
                                          text: 'حدد موقعك',
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        IconButton(
                                          onPressed: () {},
                                          icon: const Icon(Icons.location_on,
                                              color: Colors.blue),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10.h),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Expanded(
                                          child: CustomText(
                                            text:
                                                'التطبيق مجرد وسيط بين مقدم الخدمة ومتلقي \nالخدمة وليس له علاقة بكلا الطرفين ولا يوجد\n عليه اي مسألة قانونية',
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            textAlign: TextAlign.right,
                                          ),
                                        ),
                                        Transform.translate(
                                          offset: Offset(0, -5.h),
                                          child: Checkbox(
                                            value: cubit.providesServices,
                                            onChanged: (bool? value) {
                                              cubit.onServiceChanged(value);
                                            },
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            side: const BorderSide(width: 0.0),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 30.h),
                                    CustomButton(
                                      onPressed: () {
                                        cubit.buttonSignUp(context);
                                      },
                                      text: AppStrings.signUp,
                                    ),
                                    SizedBox(height: 30.h),
                                    RichText(
                                      textAlign: TextAlign.center,
                                      text: const TextSpan(
                                        style: TextStyle(color: Colors.black),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: 'ليس لديك حساب ؟  ',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16),
                                          ),
                                          TextSpan(
                                            text: 'انشئ حساب هنا',
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Color(0xFF3EBBDD),
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'assets/icon_google.png',
                                          width: 50.w, // Use .w for image size
                                          height: 50.h,
                                        ),
                                        SizedBox(
                                            width: 16.w),
                                        Image.asset(
                                          'assets/icon_face.png',
                                          width: 50.w, // Use .w for image size
                                          height: 50.h,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
        },
      ),
    );
  }
}
