import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:webbing_fixed/core/app_text/AppText.dart';
import 'package:webbing_fixed/core/custom_button/custom_buttom.dart';
import 'package:webbing_fixed/core/route/routes.dart';
import 'package:webbing_fixed/core/text_failed/custom_text_failed.dart';

class LoginBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Center(
            child: CustomText(
              text: 'signIn'.tr(),  // Use translation key
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
          Stack(
            children: [
              // Container 1 (Gray)
              Container(
                height: 700,
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),
                          CustomText(
                            text: 'emailOrPhone'.tr(),  // Use translation key
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                          const SizedBox(height: 10),
                          const CustomTextField(
                            keyboardType: TextInputType.emailAddress,
                          ),
                          const SizedBox(height: 30),
                          CustomText(
                            text: 'password'.tr(),  // Use translation key
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                          const SizedBox(height: 10),
                          const CustomTextField(
                            isPassword: true,
                            obscureText: true,
                            keyboardType: TextInputType.text,
                            maxLines: 1,
                          ),
                          const SizedBox(height: 10),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, Routes.ForgetPasswordPage);
                            },
                            child: CustomText(
                              textColor: Color(0xFF3EBBDD),
                              text: 'forgetPass'.tr(),  // Use translation key
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(height: 30),
                          CustomButton(
                            onPressed: () {
                              Navigator.pushNamed(context, Routes.mainLayoutPage);
                            },
                            text: 'signIn'.tr(),  // Use translation key
                          ),
                          const SizedBox(height: 30),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, Routes.singUpPageUser);
                            },
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                style: TextStyle(color: Colors.black),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'noAccount'.tr() + ' ',  // Use translation key
                                    style: TextStyle(color: Colors.black, fontSize: 16),
                                  ),
                                  TextSpan(
                                    text: 'createAccount'.tr(),  // Use translation key
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
                                height: 50,  // Adjusted to match image aspect ratio
                              ),
                              const SizedBox(width: 16),
                              Image.asset(
                                'assets/icon_face.png',
                                width: 50,
                                height: 50,  // Adjusted to match image aspect ratio
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
  }
}
