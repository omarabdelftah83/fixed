import 'package:flutter/material.dart';
import 'package:webbing_fixed/core/widget/custom_appar.dart';
import 'package:webbing_fixed/feature_admin/auth/sign_up/widget/sign_up_body_admin.dart';

class SingUpAdminPage extends StatelessWidget {
  const SingUpAdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(),
      body:  const CustomSingUpBody(),
    );
  }
}
