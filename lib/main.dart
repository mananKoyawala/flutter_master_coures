import 'package:flutter/material.dart';
import 'package:flutter_master_course/pages/cart_page.dart';
import 'utils/themes.dart';
import 'utils/routes.dart';
import 'pages/login_page.dart';
import 'pages/home_page.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Course",
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system, //for theme mode light, dark or system
      darkTheme:
          MyTheme.darkThemeData(context), //to Apply dark theme properties,
      theme: MyTheme.themedata(context), //to apply theme on light mode
      // initialRoute: MyRoutes.homeRoute,
      routes: {
        MyRoutes.homeRoute: (context) => const HomePage(),
        MyRoutes.loginRoute: (context) => const LoginPage(),
        MyRoutes.cartRoute: (context) => const CartPage(),
      },
      home: Splash(),
    );
  }
}

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Lottie.asset("assets/jsons/splash.json"),
      backgroundColor: Colors.white,
      nextScreen: HomePage(),
      duration: 5000,
      splashIconSize: MediaQuery.of(context).size.height / 3,
      splashTransition: SplashTransition.slideTransition,
      pageTransitionType: PageTransitionType.leftToRightWithFade,
      animationDuration: const Duration(seconds: 1),
    );
  }
}
