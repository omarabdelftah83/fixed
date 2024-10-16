import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webbing_fixed/core/app_text/AppText.dart';
import 'package:webbing_fixed/core/custom_button/custom_buttom.dart';
import 'package:webbing_fixed/core/services/service_locator.dart';
import 'package:webbing_fixed/core/text_failed/custom_text_failed.dart';
import 'package:webbing_fixed/features_user/auth/forget_passwored/controll/reset_password_cubit.dart';
import 'package:webbing_fixed/features_user/auth/forget_passwored/controll/reset_password_state.dart';

class ForgetPassWoredBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => serLoc<ForgetPasswordCubit>(),
      child: BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
        builder: (context, state) {
          final cubit = BlocProvider.of<ForgetPasswordCubit>(context);

          return
            state is ForgetPasswordLoading
            ? const Center(child: CircularProgressIndicator())
           : SingleChildScrollView(

             child: Column(
              children: [
                const Center(
                  child: CustomText(
                    text: 'نسيت كلمة المرور ؟',
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Stack(
                  children: [
                    Container(
                      height: 580.h,
                      margin: const EdgeInsets.only(top: 40),
                      decoration: const BoxDecoration(
                        color: Color(0xFF3EBBDD),
                        borderRadius: BorderRadius.all(Radius.circular(30)),
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
                              const Align(
                                alignment: Alignment.topRight,
                                child: CustomText(
                                  text: 'البريد الاكتروني او رقم الهاتف',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(height: 10),
                               CustomTextField(
                                errorText: cubit.emailError,
                                controller:cubit. emailAddressController,
                                hintText: 'Example@gmail.com',
                                keyboardType: TextInputType.emailAddress,
                                onChanged: (value) {
                                  cubit.onChangeEmail(value);
                                },
                              ),
                              const SizedBox(height: 30),
                              CustomButton(
                                onPressed: () {
                                  cubit.buttonForgetPassword(context);
                                },
                                text: 'تاكيد',
                              ),
                              const SizedBox(height: 30),
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