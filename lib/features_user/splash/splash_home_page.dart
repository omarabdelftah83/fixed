import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webbing_fixed/core/route/routes.dart';

class SplashHomePage extends StatefulWidget {
  @override
  _SplashHomePageState createState() => _SplashHomePageState();
}

class _SplashHomePageState extends State<SplashHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
    Navigator.pushNamed(context, Routes.onBoardingPage);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/image/Splash@3x.png'),
      ),
    );
  }
}

