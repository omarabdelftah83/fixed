import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webbing_fixed/core/App_string/app_string.dart';
import 'package:webbing_fixed/core/app_text/AppText.dart';
import 'package:webbing_fixed/core/custom_button/custom_buttom.dart';
import 'package:webbing_fixed/core/route/routes.dart';
import 'package:webbing_fixed/core/text_failed/custom_text_failed.dart';
import 'package:webbing_fixed/feature_admin/auth/sign_in/controll/sign_in_cubit.dart';
import 'package:webbing_fixed/feature_admin/auth/sign_in/controll/sign_in_state.dart';
import 'package:webbing_fixed/network/api_service.dart';

class SignInBodyAdmin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(ApiService()),
      child: BlocBuilder<SignInCubit, SignInState>(
        builder: (context, state) {
          final cubit=BlocProvider.of<SignInCubit>(context);
          return
            state is SingInLoading
            ? const Center(child: CircularProgressIndicator())
        :    SingleChildScrollView(
          child: Column(
              children: [
                const Center(
                  child: CustomText(
                    text: AppStrings.signIn,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Stack(
                  children: [
                    // Container 1 (Gray) //
                    Container(
                      height: 700,
                      margin: const EdgeInsets.only(top: 40),
                      decoration: const BoxDecoration(
                        color: Color(0xFF3EBBDD),
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                    ),
                    // Container 2 (White)//
                    Positioned(
                      top: 80,
                      left: 0.0,
                      right: 0.0,
                      bottom: 10,
                      child: Container(
                        height: 350,
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
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                const SizedBox(height: 10),
                                const Align(
                                  alignment: Alignment.topRight,
                                  child: CustomText(
                                    text: AppStrings.emailOrPhone,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                 CustomTextField(
                                  errorText: cubit.emailError,
                                  controller: cubit.emailAddressController,
                                  keyboardType: TextInputType.emailAddress,
                                  onChanged: cubit.onChangeEmail,
                                ),
                                const SizedBox(height: 30),
                                const Align(
                                  alignment: Alignment.topRight,
                                  child: CustomText(
                                    text: AppStrings.password,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                 CustomTextField(
                                  errorText: cubit.passError,
                                  controller: cubit.passwordController,
                                  keyboardType: TextInputType.visiblePassword,
                                  onChanged: cubit.onChangePass,
                                  isPassword: true,
                                  obscureText: true,
                                ),
                                const SizedBox(height: 10),
                                InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, Routes.ForgetPasswordPage);
                                  },
                                  child: const Align(
                                    alignment: Alignment.topRight,
                                    child: CustomText(
                                      textColor: Color(0xFF3EBBDD),
                                      text: AppStrings.forgetPass,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 30),
                                CustomButton(
                                  onPressed: () {
                                    cubit.buttonSignIn(context);
                                  },
                                  text: AppStrings.signIn,
                                ),
                                const SizedBox(height: 30),
                                InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, Routes.singUpAdminPage);
                                  },
                                  child: RichText(
                                    textAlign: TextAlign.center,
                                    text: const TextSpan(
                                      style: TextStyle(color: Colors.black),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: AppStrings.noAccount + ' ',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16),
                                        ),
                                        TextSpan(
                                          text: AppStrings.createAccount,
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Color(0xFF3EBBDD),
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/icon_google.png',
                                      width: 50,
                                      height: 100,
                                    ),
                                    const SizedBox(width: 16),
                                    Image.asset(
                                      'assets/icon_face.png',
                                      width: 50,
                                      height: 100,
                                    ),
                                  ],
                                ),
                              ],
                            ),
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
