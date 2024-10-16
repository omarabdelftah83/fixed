import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:webbing_fixed/core/services/service_locator.dart';
import 'package:webbing_fixed/feature_admin/home/controll/home_cubit.dart';
import 'package:webbing_fixed/feature_admin/mainlayout/main_layout_admin_page.dart';
import 'package:webbing_fixed/feature_admin/orders/controll/order_cubit.dart';
import 'package:webbing_fixed/features_user/home/controll/home_user_cubit.dart';
import 'package:webbing_fixed/features_user/order/controll/orders_cubit.dart';
import 'package:webbing_fixed/features_user/sitting/controll/profile_cubit.dart';
import 'core/route/routes.dart';
import 'feature_admin/auth/sign_up/controll/sign_up_cubit.dart';
import 'feature_admin/mainlayout/controll/mainlayoutadmin_cubit.dart';
import 'features_user/main_layout/presentaion/main_layout_cubit.dart';
import 'features_user/main_layout/presentaion/mainlayout_page.dart';
import 'features_user/onboarding/controll/on_boarding_cubit.dart';
import 'features_user/sitting_user/controll/lang_user_cubit.dart';
import 'features_user/splash/splash_home_page.dart';
import 'helpers/cache_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ServiesLcator().init();
  await CacheHelper.init();
  await EasyLocalization.ensureInitialized();

  String? token = CacheHelper.getToken();
  bool? provider = CacheHelper.getUserRole();
  Widget startWidget;

  if (token != null) {

    if (provider == true) {
      startWidget = const MainLayoutPageAdmin();
    } else {
      startWidget = const MainLayoutPage();
    }
  } else {
    startWidget = SplashHomePage();
  }

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('ar', 'SA'),
      ],
      path: 'assets/translation',
      startLocale: const Locale('en', 'US'),
      child: MyApp(startWidget: startWidget),
    ),
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.startWidget});
  final Widget startWidget;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [

        BlocProvider<HomeUserCubit>(
          create: (context) => serLoc<HomeUserCubit>(),
        ),
        BlocProvider<LangUserCubit>(
          create: (context) => serLoc<LangUserCubit>(),
        ),
        BlocProvider<OrdersUserCubit>(
          create: (context) => serLoc<OrdersUserCubit>(),
        ),
        BlocProvider<OnBoardingCubit>(
          create: (context) => serLoc<OnBoardingCubit>(),
        ),
        BlocProvider<ProfileCubit>(
          create: (context) => serLoc<ProfileCubit>(),
        ),
        BlocProvider<HomeCubit>(
          create: (context) => serLoc<HomeCubit>(),
        ),
        BlocProvider<OrderCubit>(
          create: (context) => serLoc<OrderCubit>(),
        ),
        BlocProvider<SignUpCubit>(
          create: (context) => serLoc<SignUpCubit>(),
        ),
        BlocProvider<MainScreenCubit>(
          create: (context) => MainScreenCubit(),
        ),
        BlocProvider<MainLayOutAdminCubit>(
          create: (context) => MainLayOutAdminCubit(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            home: startWidget,  // الشاشة التي سيتم عرضها عند بدء التطبيق
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              useMaterial3: false,
              fontFamily: 'Cairo',
              appBarTheme: const AppBarTheme(
                centerTitle: true,
                titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Cairo',
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.transparent,
                ),
                color: Colors.white,
                elevation: 0,
              ),
            ),
           // initialRoute: Routes.splashHomePage,
            onGenerateRoute: RouteGenarator.getRoute,
          );
        },
      ),
    );
  }
}
