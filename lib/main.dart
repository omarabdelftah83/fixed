import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';  // Import EasyLocalization
import 'package:webbing_fixed/core/services/service_locator.dart';
import 'package:webbing_fixed/feature_admin/auth/sign_up/sign_up.dart';
import 'core/route/routes.dart';
import 'feature_admin/mainlayout/controll/mainlayoutadmin_cubit.dart';
import 'features_user/main_layout/presentaion/main_layout_cubit.dart';
import 'helpers/cache_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ServiesLcator().init();
  await CacheHelper.init();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('ar', 'SA'),
      ],
      path: 'assets/translation',
      fallbackLocale: const Locale('en', 'US'),
      startLocale: const Locale('en', 'US'),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MainScreenCubit>(
          create: (context) => MainScreenCubit(),
        ),
        BlocProvider<MainLayOutAdminCubit>(
          create: (context) => MainLayOutAdminCubit(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),  // Adjust based on your design size
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          final locale = context.locale;
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            localizationsDelegates: context.localizationDelegates,  // Add localization delegates
            supportedLocales: context.supportedLocales,  // Supported locales
            locale: context.locale,  // Current locale
            home: const SingUpAdminPage(),
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
            initialRoute: Routes.splashHomePage,
            onGenerateRoute: RouteGenarator.getRoute,
          );
        },
      ),
    );
  }
}
