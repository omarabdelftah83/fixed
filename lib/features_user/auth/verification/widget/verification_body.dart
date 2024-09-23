import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webbing_fixed/core/App_string/app_string.dart';
import 'package:webbing_fixed/core/app_text/AppText.dart';
import 'package:webbing_fixed/core/custom_button/custom_buttom.dart';
import 'package:webbing_fixed/core/services/service_locator.dart';
import 'package:webbing_fixed/features_user/auth/verification/controll/otp_cubit.dart';
import 'package:webbing_fixed/features_user/auth/verification/widget/timer.dart';

class VerificationBody extends StatelessWidget {
  const VerificationBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => serLoc<OtpCubit>(),
      child: BlocBuilder<OtpCubit, OtpState>(
        builder: (context, state) {
          final cubit = BlocProvider.of<OtpCubit>(context);

          return state is OtpLoading
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      const Center(
                        child: CustomText(
                          text: 'استرجاع كلمة المرور',
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Stack(
                        children: [
                          // Container 1 (Gray)
                          Container(
                            height: 600.h,
                            margin: const EdgeInsets.only(top: 40),
                            decoration: const BoxDecoration(
                              color: Color(0xFF3EBBDD),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                            ),
                          ),
                          // Container 2 (White)
                          Positioned(
                            top: 80,
                            left: 0.0,
                            right: 0.0,
                            bottom: 10,
                            child: Container(
                              height: 350.h,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(40),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  children: [
                                    const SizedBox(height: 10),
                                    const Center(
                                      child: CustomText(
                                        text: 'اكتب الكود! ',
                                        fontSize: 24,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    Directionality(
                                      textDirection: TextDirection.ltr,
                                      child: OtpTextField(
                                        onSubmit: (value) {
                                          cubit.onChangeOtp(value);
                                        },
                                        numberOfFields: 6,
                                        fieldHeight: 50.h,
                                        fieldWidth: 50.h,
                                        cursorColor: Colors.blue,
                                        contentPadding: const EdgeInsets.all(2),
                                        focusedBorderColor: Colors.blue,
                                        showFieldAsBox: true,
                                      ),
                                    ),
                                    const SizedBox(height: 40),
                                    CustomButton(
                                      onPressed: () {
                                        cubit.buttonOtp(context);
                                      },
                                      text: AppStrings.ofCourse,
                                    ),
                                    const SizedBox(height: 50),
                                     Center(
                                      child: InkWell(
                                        onTap: (){
                                          Navigator.pop(context);
                                        },
                                        child: const CustomText(
                                          text: 'رجوع ',
                                          textColor: Color(0xFF3EBBDD),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    const SizedBox(height: 20),
                                    CountdownTimer(
                                      seconds: 60,
                                      onFinished: () {},
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
