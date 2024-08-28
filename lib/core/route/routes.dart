import 'package:flutter/material.dart';
import 'package:webbing_fixed/features_user/auth/forget_passwored/forget_passwored_page.dart';
import 'package:webbing_fixed/features_user/auth/login_in/login_page.dart';
import 'package:webbing_fixed/features_user/auth/new_passwored/new_passwored_page.dart';
import 'package:webbing_fixed/features_user/auth/sing_up/sing_up_page.dart';
import 'package:webbing_fixed/features_user/auth/verification/verification_page.dart';
import 'package:webbing_fixed/features_user/home/screen/condetion_fixed.dart';
import 'package:webbing_fixed/features_user/home/screen/review_page.dart';
import 'package:webbing_fixed/features_user/home/screen/splash_page.dart';
import 'package:webbing_fixed/features_user/main_layout/presentaion/mainlayout_page.dart';
import 'package:webbing_fixed/features_user/order/order_pag.dart';

import '../../features_user/home/screen/home_page.dart';

class Routes {
  static const String home = '/';
  static const String newPasswordPage = '/NewPasswordPage';
  static const String VerificationBody = '/VerificationBody';
  static const String singUpBody = '/SingUpBody';
  static const String ForgetPasswordPage = '/chat';
  static const String mainLayoutPage = '/mainLayoutPage';
  static const String conditionFixed = '/ConditionFixed';
  static const String signInBody = '/SingInpBody';
  static const String ratePage = '/ratePage';
  static const String splashPage = '/SplashPage';






  static const String ordersScreen = '/ordersScreen';
}

class RouteGenarator {
  static Route<dynamic> getRoute(RouteSettings sitting) {
    switch (sitting.name) {
      case Routes.splashPage:
        return MaterialPageRoute(builder: (_) => const SplashPage());
      case Routes.signInBody:
        return MaterialPageRoute(builder: (_) => const SingInPage());
      case Routes.newPasswordPage:
        return MaterialPageRoute(builder: (_) => const NewPasswordPage());
      case Routes.singUpBody:
        return MaterialPageRoute(builder: (_) => const SingUpPage());
      case Routes.home:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case Routes.VerificationBody:
        return MaterialPageRoute(builder: (_) => const VerificationPage());
      case Routes.ForgetPasswordPage:
        return MaterialPageRoute(builder: (_) => const ForgetPasswordPage());
      case Routes.mainLayoutPage:
        return MaterialPageRoute(builder: (_) => const MainLayoutPage());
      case Routes.conditionFixed:
        return MaterialPageRoute(builder: (_) => const ConditionFixed());
      case Routes.ratePage:
        return MaterialPageRoute(builder: (_) => const ReviewPage());
      case Routes.ordersScreen:
        return MaterialPageRoute(builder: (_) => const OrdersPage());
      default:
        return unDefinedRoute();
    }
  }
  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
          appBar: AppBar(
            title: const Text('noRouteFound'),
          ),
        ));
  }}
