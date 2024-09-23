import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webbing_fixed/core/App_string/app_string.dart';
import 'package:webbing_fixed/core/app_text/AppText.dart';
import 'package:webbing_fixed/core/custom_button/custom_buttom.dart';
import 'package:webbing_fixed/core/route/routes.dart';
import 'package:webbing_fixed/core/services/service_locator.dart';
import 'package:webbing_fixed/core/text_failed/custom_text_failed.dart';
import 'package:webbing_fixed/features_user/auth/create_new_passwored/cotroll/create_new_password_cubit.dart';

class NewPasswordBody extends StatelessWidget {
  const NewPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocProvider(
        create: (context) => serLoc<CreateNewPasswordCubit>(),
        child: BlocBuilder<CreateNewPasswordCubit, CreateNewPasswordState>(
          builder: (context, state) {
            final cubit = BlocProvider.of<CreateNewPasswordCubit>(context);
            return
              state is CreateNewPasswordLoading ?
                  ? const Center(child: CircularProgressIndicator())
             : Column(
              children: [
                const Center(
                  child: CustomText(
                    text: 'انشاء كلمة مرور جديدة',
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
                                  text: 'كلمة مرور جديدة ',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(height: 10),
                               CustomTextField(
                                errorText:cubit.passError ,
                                controller:cubit. passwordController,
                                hintText: '********',
                                onChanged: (value) {
                                  cubit.onChangePass(value);
                                },
                                keyboardType: TextInputType.visiblePassword,
                                maxLines: 1,
                                isPassword: true,
                                obscureText: true,
                              ),
                              const SizedBox(height: 30),
                              const Align(
                                alignment: Alignment.topRight,
                                child: CustomText(
                                  text: 'تأكيد كلمة المرور',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(height: 10),
                               CustomTextField(
                                errorText: cubit.confirmPasswordError,
                                controller:cubit. passwordConfirmController,
                                hintText: '********',
                                keyboardType: TextInputType.visiblePassword,
                                onChanged: (value) {
                                  cubit.onChangeConfirmPassword(value);
                                },
                                maxLines: 1,
                                isPassword: true,
                                obscureText: true,
                              ),
                              const SizedBox(height: 30),
                              CustomButton(
                                onPressed: () {
                                cubit.buttonCreatePass(context);
                                },
                                text: AppStrings.ofCourse,
                              ),
                              const SizedBox(height: 30),
                              const Center(
                                child: CustomText(
                                  text: 'رجوع ',
                                  textColor: Color(0xFF3EBBDD),
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
            );
          },
        ),
      ),
    );
  }
}
