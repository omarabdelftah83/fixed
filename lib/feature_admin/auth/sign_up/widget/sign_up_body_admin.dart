import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:webbing_fixed/core/App_string/app_string.dart';
import 'package:webbing_fixed/core/app_text/AppText.dart';
import 'package:webbing_fixed/core/custom_button/custom_buttom.dart';
import 'package:webbing_fixed/core/route/routes.dart';
import 'package:webbing_fixed/core/text_failed/custom_text_failed.dart';

class CustomSingUpBody extends StatelessWidget {
  const CustomSingUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

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
                height: 1170,
                margin: const EdgeInsets.only(top: 40),
                decoration: const BoxDecoration(
                  color: Color(0xFFB9C0C9),
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
                  height: 500,
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
                            text: '* الاسم',
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const CustomTextField(
                          hintText: 'مستخدم',
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(height: 10),
                        const Align(
                          alignment: Alignment.topRight,
                          child: CustomText(
                            text: '* رقم الهاتف',
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const CustomTextField(
                          hintText: '123456789',
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(height: 10),
                        const Align(
                          alignment: Alignment.topRight,
                          child: CustomText(
                            text: 'البريد الاكتروني(اختياري)',
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const CustomTextField(
                          hintText: 'om@gmail.com',
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(height: 10),
                        const Align(
                          alignment: Alignment.topRight,
                          child: CustomText(
                            text: '* كلمة المرور',
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const CustomTextField(
                          isPassword: true,
                          obscureText: true,
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(height: 10),
                        const Align(
                          alignment: Alignment.topRight,
                          child: CustomText(
                            text: '* تاكيد كلمة المرور',
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const CustomTextField(
                          isPassword: true,
                          obscureText: true,
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(height: 10),
                        const Align(
                          alignment: Alignment.topRight,
                          child: CustomText(
                            text: '* العنوان',
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 10),
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
                        const SizedBox(height: 10),
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
                              offset: const Offset(0, -5),
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
                        const SizedBox(height: 10),
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
                                          print('تم النقر على الشروط والاحكام');
                                        },
                                    ),
                                    const TextSpan(
                                        text: 'يرجى قراءة الشروط والاحكام بعناية قبل التسجيل '),
                                  ],
                                ),
                              ),
                            ),
                            Transform.translate(
                              offset: const Offset(0, -9),
                              child: Checkbox(
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                side: const BorderSide(width: 0.0),
                                value: false,
                                onChanged: (bool? value) {
                                  // تنفيذ هنا لتغيير حالة الـ Checkbox
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        CustomButton(
                          onPressed: () {
                            Navigator.pushNamed(context, Routes.mainLayoutPage);
                          },
                          text: AppStrings.signUp,
                        ),
                        const SizedBox(height: 30),
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
                                  color: Color(0xFFB9C0C9),
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
            ],
          ),
        ],
      ),
    );
  }
}
