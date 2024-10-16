
import 'package:flutter/material.dart';
import 'package:webbing_fixed/core/widget/custom_appar.dart';
import 'package:webbing_fixed/features_user/auth/sing_up/widget/singUp_body.dart';

class SingUpPageUser extends StatelessWidget {
  const SingUpPageUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(),
      body: const SingUpBody(),
    );
  }
}
