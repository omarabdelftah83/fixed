import 'package:flutter/material.dart';
import 'package:webbing_fixed/core/widget/custom_appar.dart';
import 'package:webbing_fixed/features_user/sitting/widget/sitting_body.dart';


class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body:  Settingbody(),
    );
  }
}