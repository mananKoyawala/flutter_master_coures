import 'package:flutter/material.dart';
import 'package:flutter_master_course/pages/cart.dart';
import 'utils/themes.dart';
import 'utils/routes.dart';
import 'pages/login_page.dart';
import 'pages/home_page.dart';

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
      initialRoute: MyRoutes.homeRoute,
      routes: {
        "/": (context) => const LoginPage(),
        MyRoutes.homeRoute: (context) => const HomePage(),
        MyRoutes.loginRoute: (context) => const LoginPage(),
        MyRoutes.cartRoute: (context) => const CartPage(),
      },
    );
  }
}
