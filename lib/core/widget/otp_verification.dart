import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class OtpTextFieldVerification extends StatelessWidget {
  final Function(String) onCodeEntered; // ممرر للاستدعاء عندما يتم إدخال الكود

  const OtpTextFieldVerification({
    Key? key,
    required this.onCodeEntered, // تأكد من أن الدالة المطلوبة تم تمريرها
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OtpTextField(
      cursorColor: Colors.orange,
      numberOfFields: 4,
      borderColor: Colors.grey,
      showFieldAsBox: true,
      fieldWidth: 50,
      fieldHeight: 50,
      textStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.cyan,
        fontFamily: 'Poppins',
      ),
      focusedBorderColor: Colors.lightBlue,
      enabledBorderColor: Color(0xFFD9D9D9),
      onSubmit: (String verificationCode) {
        onCodeEntered(verificationCode); // استدعاء الدالة عند إدخال الكود
      },
    );
  }
}
