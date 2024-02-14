import 'package:flutter/material.dart';
import 'package:flutter_master_course/pages/user_decision_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    moveToNext();
  }

  moveToNext() async {
    await Future.delayed(const Duration(milliseconds: 2000));
    goTo();
  }

  goTo() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const UserDecisionPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center,
        color: Theme.of(context).canvasColor,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(40),
          child: Image.asset(
            'assets/logo/ic_android.png',
            fit: BoxFit.cover,
            height: 150,
            width: 150,
          ),
        ),
      ),
    );
  }
}
