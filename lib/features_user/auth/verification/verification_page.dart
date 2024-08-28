import 'package:flutter/material.dart';
import 'package:webbing_fixed/features_user/auth/verification/widget/verification_appBar.dart';
import 'package:webbing_fixed/features_user/auth/verification/widget/verification_body.dart';

class VerificationPage extends StatelessWidget {
  const VerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: VerificationAppbar(),
      body:  const VerificationBody(),
    );
  }
}
