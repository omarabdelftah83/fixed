import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:webbing_fixed/core/App_string/app_string.dart';
import 'package:webbing_fixed/core/app_text/AppText.dart';
import 'package:webbing_fixed/core/custom_button/custom_buttom.dart';
import 'package:webbing_fixed/core/widget/custom_app_padding.dart';
import 'package:webbing_fixed/feature_admin/orders/controll/order_cubit.dart';
import 'package:webbing_fixed/feature_admin/orders/controll/order_state.dart';
import 'package:webbing_fixed/features_user/order/controll/orders_cubit.dart';
import 'package:webbing_fixed/features_user/order/controll/orders_state.dart';

class ReviewPageAmin extends StatefulWidget {
  const ReviewPageAmin({super.key, required this.idUser});
  final int idUser; // تعريف idProvider

  @override
  State<ReviewPageAmin> createState() => _ReviewPageAminState();
}

class _ReviewPageAminState extends State<ReviewPageAmin> {
  double _currentRating = 0.0; // Variable to hold the rating value
  final TextEditingController _commentController = TextEditingController(); // Controller for the comment

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;
final  cubit =BlocProvider.of<OrderCubit>(context);
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
              const CustomText(text: 'Omar Mohamed', fontSize: 16, fontWeight: FontWeight.w400),
              SizedBox(height: screenHeight * 0.05),
              RatingBar.builder(
                initialRating: 0,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemBuilder: (context, _) => const Icon(
                  Icons.star_rounded,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  setState(() {
                    _currentRating = rating; // Store the rating value
                  });
                },
              ),
              SizedBox(height: screenHeight * 0.05),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Padding(
                  padding: EdgeInsets.all(screenWidth * 0.02),
                  child: TextField(
                    controller: _commentController, // Attach the controller
                    textAlign: TextAlign.start,
                    maxLines: 3,
                    decoration: const InputDecoration(
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
              if (_currentRating > 0) {
                cubit.reviewAdminServices(
                  _currentRating.toInt(),
                  widget.idUser,
                  context
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('يرجى إضافة تقييم قبل الإرسال')),
                );
              }
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

  @override
  void dispose() {
    _commentController.dispose(); // Dispose of the controller when not needed
    super.dispose();
  }
}
