import 'package:flutter/material.dart';
import 'package:webbing_fixed/core/widget/custom_appar.dart';
import 'package:webbing_fixed/features_user/sitting/widget/sitting_body.dart';
import 'package:webbing_fixed/features_user/sitting_user/widget/setting_user_body.dart';


class SittingUserPage extends StatelessWidget {
  const SittingUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body:  const SettingUserbody(),
    );
  }
}