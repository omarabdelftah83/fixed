import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:webbing_fixed/core/App_string/app_string.dart';
import 'package:webbing_fixed/core/app_text/AppText.dart';
import 'package:webbing_fixed/core/custom_button/custom_buttom.dart';
import 'package:webbing_fixed/core/route/routes.dart';
import 'package:webbing_fixed/core/widget/custom_app_padding.dart';

class ReviewPage extends StatelessWidget {
  const ReviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return Scaffold(
      body: CustomPaddingApp(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: CustomText(
                  text: 'تقييم مقدم الخدمة',
                  fontSize: 24 * textScaleFactor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: screenHeight * 0.1), // Adjust height based on screen size
              CircleAvatar(
                backgroundColor: const Color(0xFFD9D9D9),
                radius: screenWidth * 0.15, // CircleAvatar size responsive
              ),
              SizedBox(height: screenHeight * 0.05),
              RatingBar.builder(
                initialRating: 0,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: screenWidth * 0.001),
                itemBuilder: (context, _) => const Icon(
                  Icons.star_rounded,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
              SizedBox(height: screenHeight * 0.05),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Padding(
                  padding: EdgeInsets.all(screenWidth * 0.02),
                  child: const TextField(
                    textAlign: TextAlign.start,
                    maxLines: 3,
                    decoration: InputDecoration(
                      hintText: '.....أضف تعليقك',
                      hintTextDirection: TextDirection.rtl,
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.07),
              CustomButton(
                onPressed: () {
                   Navigator.pushNamed(context, Routes.splashPage);
                },
                text: AppStrings.review,
              ),
              SizedBox(height: screenHeight * 0.03),
            ],
          ),
        ),
      ),
    );
  }
}
