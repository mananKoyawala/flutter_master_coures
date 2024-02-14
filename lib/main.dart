import 'package:flutter/material.dart';
import 'package:flutter_master_course/pages/home_page.dart';
import 'package:flutter_master_course/pages/login_page.dart';
import 'package:flutter_master_course/pages/splash_screen.dart';
import 'package:flutter_master_course/utils/routes.dart';
import 'package:flutter_master_course/utils/themes.dart';
import 'core/store.dart';
import 'pages/cart_page.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  FlutterNativeSplash.remove();
  await GetStorage.init();
  runApp(VxState(store: MyStore(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Catalog App",
      debugShowCheckedModeBanner: false,
      themeMode:
          ThemeServices().theme, //for theme mode light, dark or system //!
      // themeMode: ,
      darkTheme:
          MyTheme.darkThemeData(context), //to Apply dark theme properties,
      theme: MyTheme.themedata(context), //to apply theme on light mode
      // initialRoute: MyRoutes.homeRoute,
      routes: {
        MyRoutes.homeRoute: (context) => const HomePage(),
        MyRoutes.loginRoute: (context) => const LoginPage(),
        MyRoutes.cartRoute: (context) => const CartPage(),
      },
      home: const SplashScreen(),
    );
  }
}

// cd Users\manan\AppData\Local\Android\Sdk\platform-tools
