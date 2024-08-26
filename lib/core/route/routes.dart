import 'package:flutter/material.dart';
import 'package:webbing_fixed/features/auth/forget_passwored/forget_passwored_page.dart';

import 'package:webbing_fixed/features/auth/login_in/login_page.dart';
import 'package:webbing_fixed/features/auth/new_passwored/new_passwored_page.dart';
import 'package:webbing_fixed/features/auth/sing_up/sing_up_page.dart';
import 'package:webbing_fixed/features/main_layout/presentaion/mainlayout_page.dart';
import 'package:webbing_fixed/features/order/order_pag.dart';
import 'package:webbing_fixed/home/presention/home_page.dart';
import 'package:webbing_fixed/home/presention/screen/condetion_fixed.dart';

import '../../features/auth/verification/verification_page.dart';

class Routes {
  static const String home = '/';
  static const String newPasswordPage = '/NewPasswordPage';
  static const String VerificationBody = '/VerificationBody';
  static const String singUpBody = '/SingUpBody';
  static const String ForgetPasswordPage = '/chat';
  static const String mainLayoutPage = '/mainLayoutPage';
  static const String conditionFixed = '/ConditionFixed';
  static const String signInBody = '/SingInpBody';





  static const String ordersScreen = '/ordersScreen';
}

class RouteGenarator {
  static Route<dynamic> getRoute(RouteSettings sitting) {
    switch (sitting.name) {
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
