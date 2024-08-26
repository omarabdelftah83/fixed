 import 'package:flutter/material.dart';
import 'package:webbing_fixed/core/App_string/app_string.dart';
import 'package:webbing_fixed/core/app_text/AppText.dart';
import 'package:webbing_fixed/core/custom_button/custom_buttom.dart';
import 'package:webbing_fixed/core/route/routes.dart';
import 'package:webbing_fixed/core/text_failed/custom_text_failed.dart';

 class NewPasswordBody extends StatelessWidget {
   const NewPasswordBody({super.key});

   @override
   Widget build(BuildContext context) {
     final screenHeight = MediaQuery.of(context).size.height;
     final screenWidth = MediaQuery.of(context).size.width;

     return SingleChildScrollView(
       child: Column(
         children: [
           const Center(
             child: CustomText(
               text: 'انشاء كلمة مرور جديدة',
               fontSize: 24,
               fontWeight: FontWeight.w600,
             ),
           ),
           Stack(
             children: [
               // Container 1 (Gray)
               Container(
                 height: 600,
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
                     child: Column(
                       children: [
                         const SizedBox(height: 10),
                         const Align(
                           alignment: Alignment.topRight,
                           child: CustomText(
                             text: 'كلمة مرور جديدة ',
                             fontSize: 18,
                             fontWeight: FontWeight.w400,
                           ),
                         ),
                         const SizedBox(height: 10),
                         const CustomTextField(
                           maxLines: 1,
                           isPassword: true,
                           obscureText: true,
                           keyboardType: TextInputType.emailAddress,
                         ),
                         const SizedBox(height: 30),
                         const Align(
                           alignment: Alignment.topRight,
                           child: CustomText(
                             text: 'تأكيد كلمة المرور',
                             fontSize: 18,
                             fontWeight: FontWeight.w400,
                           ),
                         ),
                         const SizedBox(height: 10),
                         const CustomTextField(
                           maxLines: 1,
                           isPassword: true,
                           obscureText: true,
                           keyboardType: TextInputType.emailAddress,
                         ),
                         const SizedBox(height: 30),
                         CustomElevatedButton(
                           onPressed: () {
                             Navigator.pushNamed(context, Routes.VerificationBody);
                           },
                           text: AppStrings.ofCourse,
                         ),
                         const SizedBox(height: 30),
                         const Center(
                           child: CustomText(
                             text: 'رجوع ',
                             textColor: Color(0xFFB9C0C9),
                           ),
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
