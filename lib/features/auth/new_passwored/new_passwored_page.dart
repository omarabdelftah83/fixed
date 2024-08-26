 import 'package:flutter/material.dart';
import 'package:webbing_fixed/core/widget/custom_appar.dart';
import 'widget/new_password_body.dart';

class NewPasswordPage extends StatelessWidget {
  const NewPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(),
      body: const NewPasswordBody(),
    );  }
}
