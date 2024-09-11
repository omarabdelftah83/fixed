import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'on_boarding_export.dart';
class InHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
             SizedBox(
              height: 95.h,
            ),
            Image.asset(AppAssets.inHomeImage),
             SizedBox(
              height: 10.h,
            ),
            Stack(
              children: [
                Container(
                  height: 590.h,
                  margin: const EdgeInsets.only(top: 40),
                  decoration: const BoxDecoration(
                    color: Color(0xFF3EBBDD),
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                ),
                Positioned(
                  top: 80,
                  left: 0.0,
                  right: 0.0,
                  bottom: 10,
                  child: Container(
                    height: 100,
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
                            const CustomText(
                              text: AppStrings.welcome,
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const CustomText(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              text: AppStrings.description,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 44,
                            ),
                            CustomButton(
                              onPressed: () {
                                Navigator.pushNamed(context, Routes.signInBodyUser);
                              },
                              text: AppStrings.serviceRecipient,
                              height: 48,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomButton(
                              onPressed: () {
                                Navigator.pushNamed(context, Routes.singInPageAdmin);
                              },
                              color: Colors.white,
                              textColor: const Color(0xFF3EBBDD),
                              text: AppStrings.serviceProvider,
                              height: 48,
                              borderColor: const Color(0xFF3EBBDD),
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
