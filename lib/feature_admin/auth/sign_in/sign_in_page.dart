import 'package:flutter/material.dart';
import 'package:webbing_fixed/core/widget/custom_appar.dart';
import 'package:webbing_fixed/feature_admin/auth/sign_in/widget/sign_in_body.dart';

class SignInPageAdmin extends StatelessWidget {
  const SignInPageAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(),
      body: SignInBodyAdmin(),
    );
  }
}
