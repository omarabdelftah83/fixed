import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webbing_fixed/core/App_string/app_string.dart';
import 'package:webbing_fixed/core/app_text/AppText.dart';
import 'package:webbing_fixed/core/custom_button/custom_buttom.dart';
import 'package:webbing_fixed/core/route/routes.dart';
import 'package:webbing_fixed/core/text_failed/custom_text_failed.dart';

class CustomSingUpBody extends StatelessWidget {
  const CustomSingUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return SingleChildScrollView(
      child: Column(
        children: [
          const Center(
            child: CustomText(
              text: 'انشاء حساب',
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
          Stack(
            children: [
              // Container 1 (Gray)
              Container(
                height: 1150.h,
                margin: EdgeInsets.only(top: 40.h),
                decoration: const BoxDecoration(
                  color: Color(0xFF3EBBDD),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
              ),
              // Container 2 (White)
              Positioned(
                top: 80.h,
                left: 0.0,
                right: 0.0,
                bottom: 10.h,
                child: Container(
                  height: 500.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40.r),
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
                    padding: EdgeInsets.all(16.w),
                    child: Column(
                      children: [
                        SizedBox(height: 10.h),
                        const Align(
                          alignment: Alignment.topRight,
                          child: CustomText(
                            text: '* الاسم',
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        const CustomTextField(
                          hintText: 'مستخدم',
                          keyboardType: TextInputType.emailAddress,
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
                        const CustomTextField(
                          hintText: '123456789',
                          keyboardType: TextInputType.emailAddress,
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
                        const CustomTextField(
                          hintText: 'om@gmail.com',
                          keyboardType: TextInputType.emailAddress,
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
                        const CustomTextField(
                          isPassword: true,
                          obscureText: true,
                          keyboardType: TextInputType.emailAddress,
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
                        const CustomTextField(
                          isPassword: true,
                          obscureText: true,
                          keyboardType: TextInputType.emailAddress,
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
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                                value: false,
                                onChanged: (bool? value) {},
                                materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                                side: const BorderSide(width: 0.0),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: RichText(
                                textAlign: TextAlign.right,
                                text: TextSpan(
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                    fontFamily: 'Cairo',
                                  ),
                                  children: [
                                    TextSpan(
                                      text: ' الشروط والاحكام  ',
                                      style: const TextStyle(
                                        color: Colors.red,
                                        decoration: TextDecoration.underline,
                                        fontFamily:
                                        'Cairo',
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                        Navigator.pushNamed(context, Routes.conditionsPage);
                                        },
                                    ),
                                    const TextSpan(
                                        text: 'يرجى قراءة الشروط والاحكام بعناية قبل التسجيل '),
                                  ],
                                ),
                              ),
                            ),
                            Transform.translate(
                              offset: Offset(0, -9.h),
                              child: Checkbox(
                                materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                                side: const BorderSide(width: 0.0),
                                value: false,
                                onChanged: (bool? value) {
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 30.h),
                        CustomButton(
                          onPressed: () {
                            Navigator.pushNamed(context, Routes.signUpService);
                          },
                          text: 'متابعه',
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
                                    color: Colors.black, fontSize: 16),
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/icon_google.png',
                              width: 50.w,
                              height: 100.h,
                            ),
                            SizedBox(width: 16.w),
                            Image.asset(
                              'assets/icon_face.png',
                              width: 50.w,
                              height: 100.h,
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
  }
}
