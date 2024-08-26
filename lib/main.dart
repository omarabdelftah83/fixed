import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'core/route/routes.dart';
import 'features/auth/login_in/login_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Flutter Demo',
      home:  const SingInPage(),
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
              fontSize: 20),
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.transparent),
          color: Colors.white,
          elevation: 0,
        ),
      ),
      initialRoute: Routes.signInBody,
      onGenerateRoute: RouteGenarator.getRoute,
    );
  }
}

