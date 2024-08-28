import 'package:flutter/material.dart';
import 'package:webbing_fixed/core/app_text/AppText.dart';
import 'package:webbing_fixed/core/widget/custom_app_padding.dart';
import 'package:webbing_fixed/features_user/home/widget/custom_cared_splash.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return Scaffold(
      body: CustomPaddingApp(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: const Color(0xFF3EBBDD),
                  borderRadius: BorderRadius.circular(20)),
              width: double.infinity,
              height: screenHeight * 0.16,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const SizedBox(height: 12),
                    CustomText(
                      text: 'تصليح مكيف , شباك واحد  ',
                      textColor: Colors.white,
                      fontSize: screenWidth * 0.04,
                      fontWeight: FontWeight.w600,
                    ),
                    CustomText(
                      text: 'في اقرب وقت  ',
                      textColor: Colors.white,
                      fontSize: screenWidth * 0.04,
                      fontWeight: FontWeight.w600,
                    ),
                    CustomText(
                      text: 'السعر : 150 ',
                      textColor: Colors.white,
                      fontSize: screenWidth * 0.04,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10,),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: List.generate(
                    5,
                        (index) => Padding(
                      padding: const EdgeInsets.only(bottom: 9),
                      child: SizedBox(
                        width: screenWidth,
                        child: const CustomCardSplash(),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
