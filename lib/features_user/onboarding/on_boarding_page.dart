import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webbing_fixed/core/App_assets/app_assets.dart';
import 'package:webbing_fixed/core/App_string/app_string.dart';
import 'package:webbing_fixed/core/app_text/AppText.dart';
import 'package:webbing_fixed/core/custom_button/custom_buttom.dart';
import 'package:webbing_fixed/core/route/routes.dart';

class OnboardingPage extends StatefulWidget {
  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              children: [
                _buildPage(
                  context,
                  image: AppAssets.onBoardingImage1,
                  title: AppStrings.titleDescription1,
                // description: AppStrings.description2,
                  showButton: true,
                ),
                _buildPage(
                  context,
                  image: AppAssets.onBoardingImage2,
                  title: AppStrings.titleDescription2,
                  showButton: true,
                ),
              ],
            ),
          ),

           SizedBox(height: 40.h),
          _buildIndicator(),
           SizedBox(height: 30.h),
        ],
      ),
    );
  }

  Widget _buildPage(BuildContext context,
      {required String image,
        required String title,
        String? description,
        required bool showButton}) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10,),
            Image.asset(image, height: 250, width: double.infinity),
             SizedBox(height: 5.h),
            Container(
              width: double.infinity,
              height: 220,
              child: CustomText(
                text: title,
                fontSize: 18,
                fontWeight: FontWeight.w600,
                textAlign: TextAlign.center,
              ),
            ),
             SizedBox(height: 10.h),
            CustomText(
              text: description ?? '',
              fontSize: 12,
              fontWeight: FontWeight.w400,
              textAlign: TextAlign.center,
            ),
            if (showButton)
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: CustomButton(
                  width: 340.w,
                  text: 'التالي',
                  height: 50.h,
                  onPressed: () {
                    if (_currentPage == 1) {
                      Navigator.pushNamed(context, Routes.countryPage);
                    } else {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(2, (index) => _buildDot(index)),
    );
  }

  Widget _buildDot(int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: 80.w,
      height: 8.h,
      decoration: BoxDecoration(
        color: _currentPage == index ? Colors.blue : Colors.grey,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
