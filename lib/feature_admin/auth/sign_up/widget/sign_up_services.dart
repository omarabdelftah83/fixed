import 'package:flutter/material.dart';
import 'package:webbing_fixed/core/App_string/app_string.dart';
import 'package:webbing_fixed/core/app_text/AppText.dart';
import 'package:webbing_fixed/core/custom_button/custom_buttom.dart';
import 'package:webbing_fixed/core/route/routes.dart';
import 'package:webbing_fixed/core/text_failed/custom_text_failed.dart';
import 'package:webbing_fixed/core/text_failed/drop_down_custom_textfailed.dart';
import 'package:webbing_fixed/core/widget/custom_appar.dart';

class SignUpService extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Center(
              child: CustomText(
                text: 'تسجبل الخدمه',
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
                        // Add SingleChildScrollView here
                        child: Column(
                          children: [
                            const SizedBox(height: 10),
                            const Align(
                              alignment: Alignment.topRight,
                              child: CustomText(
                                text: 'الخدمة المقدمة',
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(height: 10),
                            DropDownCustomTextfailed(
                              prefixIcon: const Icon(Icons.arrow_drop_down),
                              hintText: 'اختر الخدمة',
                              dropdownItems: const [
                                'تنظيف الخزانات',
                                'غسيل السيارات',
                                'خدمات السيارات',
                                'اعمال الحدادة',
                                'مكافحة الحشرات',
                                'نقل عفش',
                                'فني ستالايت',
                                'تنظيفات وخدم',
                                'اعمال النجارة',
                                'اعمال الكهرباء',
                                ' اعمال الدهانات',
                                'اعمال السباكة',
                                'صيانة التكييف'
                              ],
                              onDropdownChanged: (selectedItem) {},
                            ),
                            const SizedBox(height: 30),
                            const Align(
                              alignment: Alignment.topRight,
                              child: CustomText(
                                text: 'صورة البطاقة(من الامام)',
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Row(
                              children: [
                                Expanded(
                                  child: CustomTextField(
                                    prefixIcon: Icon(Icons.camera_alt_outlined),
                                    hintText: 'تحميل',
                                    keyboardType: TextInputType.emailAddress,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: CustomTextField(
                                    prefixIcon: Icon(Icons.download),
                                    hintText: 'تحميل',
                                    keyboardType: TextInputType.emailAddress,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            const Align(
                              alignment: Alignment.topRight,
                              child: CustomText(
                                text: 'صورة البطاقة(من الخلف)',
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Row(
                              children: [
                                Expanded(
                                  child: CustomTextField(
                                    prefixIcon: Icon(Icons.camera_alt_outlined),
                                    hintText: 'تحميل',
                                    keyboardType: TextInputType.emailAddress,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: CustomTextField(
                                    prefixIcon: Icon(Icons.download),
                                    hintText: 'تحميل',
                                    keyboardType: TextInputType.emailAddress,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 30),
                            const Align(
                              alignment: Alignment.topRight,
                              child: CustomText(
                                text: 'صورة شخصية',
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(height: 30),
                            const CustomTextField(
                              prefixIcon: Icon(Icons.camera_alt_outlined),
                              hintText: 'افتح الكاميرة لالتقاط صورة',
                              keyboardType: TextInputType.emailAddress,
                            ),
                            const SizedBox(height: 30),
                            CustomButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, Routes.mainLayoutPage);
                              },
                              text: 'انشاء حساب',
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
                                          color: Colors.black, fontSize: 16),
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
      ),
    );
  }
}
