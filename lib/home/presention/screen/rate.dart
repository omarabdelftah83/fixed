import 'package:flutter/material.dart';
import 'package:webbing_fixed/core/app_text/AppText.dart';
import 'package:webbing_fixed/core/widget/custom_app_padding.dart';

class RatePage extends StatelessWidget {
  const RatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: CustomPaddingApp(
            child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
          Center(
              child: CustomText(
            text: 'صيانة التكيفات',
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ))
        ]))));
  }
}
