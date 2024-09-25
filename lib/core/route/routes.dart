import 'package:flutter/material.dart';
import 'package:webbing_fixed/feature_admin/auth/sign_in/sign_in_page.dart';
import 'package:webbing_fixed/feature_admin/auth/sign_up/widget/coditions_page.dart';
import 'package:webbing_fixed/feature_admin/auth/sign_up/widget/sign_up_services_body.dart';
import 'package:webbing_fixed/feature_admin/auth/sign_up/sign_up.dart';
import 'package:webbing_fixed/feature_admin/home/widget/finish_service.dart';
import 'package:webbing_fixed/feature_admin/home/widget/notification.dart';
import 'package:webbing_fixed/feature_admin/home/widget/order_details.dart';
import 'package:webbing_fixed/feature_admin/home/widget/reject_price.dart';
import 'package:webbing_fixed/feature_admin/mainlayout/main_layout_admin_page.dart';
import 'package:webbing_fixed/feature_admin/home/widget/update_sallary.dart';
import 'package:webbing_fixed/features_user/auth/create_new_passwored/new_passwored_page.dart';
import 'package:webbing_fixed/features_user/auth/forget_passwored/forget_passwored_page.dart';
import 'package:webbing_fixed/features_user/auth/sign_in/login_page.dart';
import 'package:webbing_fixed/features_user/auth/sing_up/sing_up_page.dart';
import 'package:webbing_fixed/features_user/auth/verification/verification_page.dart';
import 'package:webbing_fixed/features_user/home/screen/condetion_fixed.dart';
import 'package:webbing_fixed/features_user/home/screen/review_page.dart';
import 'package:webbing_fixed/features_user/home/screen/splash_page.dart';
import 'package:webbing_fixed/features_user/main_layout/presentaion/mainlayout_page.dart';
import 'package:webbing_fixed/features_user/onboarding/screen/In_home_page.dart';
import 'package:webbing_fixed/features_user/onboarding/on_boarding_page.dart';
import 'package:webbing_fixed/features_user/onboarding/screen/country_page.dart';
import 'package:webbing_fixed/features_user/order/order_pag.dart';
import 'package:webbing_fixed/features_user/sitting/widget/edit_profile.dart';
import 'package:webbing_fixed/features_user/splash/splash_home_page.dart';
import 'package:webbing_fixed/features_user/wallet/wallet.dart';

import '../../features_user/home/screen/home_page.dart';

class Routes {
  static const String home = '/';
  static const String newPasswordPage = '/NewPasswordPage';
  static const String VerificationBody = '/VerificationBody';
  static const String singUpBody = '/SingUpBody';
  static const String ForgetPasswordPage = '/chat';
  static const String mainLayoutPage = '/mainLayoutPage';
  static const String conditionFixed = '/ConditionFixed';
  static const String signInBodyUser = '/SingInpBody';
  static const String reviewPage = '/reviewPage';
  static const String splashPage = '/SplashPage';
  static const String singUpAdminPage = '/SingUpAdminPage';
  static const String editProfile = '/EditProfile';
  static const String walletPage = '/WalletPage';
  static const String ordersScreen = '/ordersScreen';
  static const String inHomePage = '/inHomePage';
  static const String onBoardingPage = '/onBoardingPage';
  static const String splashHomePage = '/splashHomePage';
  static const String countryPage = '/CountryPage';
  static const String singInPageAdmin = '/SingInPageAdmin';
  static const String signUpService = '/SignUpService';
  static const String conditionsPage = '/ConditionsPage';
  static const String mainLayoutPageAdmin = '/MainLayoutPageAdmin';
  static const String orderDetails = '/OrderDetails';
  static const String notificationPage = '/notificationPage';
  static const String updateSallary = '/updateSallary';
  static const String rejectPrice = '/RejectPrice';
  static const String finishService = '/FinishService';


}

class RouteGenarator {
  static Route<dynamic> getRoute(RouteSettings sitting) {
    switch (sitting.name) {
      case Routes.finishService:
        return MaterialPageRoute(builder: (_) =>  FinishService());
      case Routes.rejectPrice:
        return MaterialPageRoute(builder: (_) =>  RejectPrice());
      case Routes.updateSallary:
        return MaterialPageRoute(builder: (_) =>  UpdateSallary());
      case Routes.notificationPage:
        return MaterialPageRoute(builder: (_) =>  NotificationPage());
      case Routes.orderDetails:
        return MaterialPageRoute(builder: (_) =>  OrderDetails());
      case Routes.mainLayoutPageAdmin:
        return MaterialPageRoute(builder: (_) =>  MainLayoutPageAdmin());
      case Routes.conditionsPage:
        return MaterialPageRoute(builder: (_) =>  ConditionsPage());
      case Routes.signUpService:
        return MaterialPageRoute(builder: (_) =>  SignUpServiceBody());
      case Routes.singInPageAdmin:
        return MaterialPageRoute(builder: (_) =>  SignInPageAdmin());
      case Routes.countryPage:
        return MaterialPageRoute(builder: (_) =>  CountryPage());
      case Routes.splashHomePage:
        return MaterialPageRoute(builder: (_) =>  SplashHomePage());
      case Routes.onBoardingPage:
        return MaterialPageRoute(builder: (_) =>  OnboardingPage());
      case Routes.inHomePage:
        return MaterialPageRoute(builder: (_) =>  InHomePage());
      case Routes.walletPage:
       return MaterialPageRoute(builder: (_) => const WalletPage());
      case Routes.editProfile:
        return MaterialPageRoute(builder: (_) => const EditProfile());
      case Routes.singUpAdminPage:
        return MaterialPageRoute(builder: (_) => const SingUpAdminPage());
      case Routes.splashPage:
        return MaterialPageRoute(builder: (_) => const SplashPage());
      case Routes.signInBodyUser:
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
      case Routes.reviewPage:
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
