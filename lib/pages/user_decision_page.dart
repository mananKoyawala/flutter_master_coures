import 'package:flutter/material.dart';
import 'package:flutter_master_course/pages/home_page.dart';
import 'package:flutter_master_course/pages/login_page.dart';
import 'package:lottie/lottie.dart';

class UserDecisionPage extends StatelessWidget {
  const UserDecisionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 50,
          ),
          Text(
            "Welcome",
            style: TextStyle(
                color: Theme.of(context).highlightColor,
                fontSize: 40,
                fontFamily: 'OpenSans'),
          ),
          const SizedBox(
            height: 40,
          ),
          InkWell(
            onTap: () => Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const HomePage())),
            child: Container(
              height: MediaQuery.of(context).size.height / 8.5,
              width: MediaQuery.of(context).size.width / 2,
              child: Center(
                  child: Text(
                "Customer".toUpperCase(),
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontFamily: 'QuickSand',
                    fontWeight: FontWeight.bold),
              )),
              decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(10)),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: () => Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const LoginPage())),
            child: Container(
              height: MediaQuery.of(context).size.height / 8.5,
              width: MediaQuery.of(context).size.width / 2,
              child: Center(
                  child: Text(
                "Merchant".toUpperCase(),
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontFamily: 'QuickSand',
                    fontWeight: FontWeight.bold),
              )),
              decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(10)),
            ),
          ),
          SizedBox(
              height: MediaQuery.of(context).size.height / 5,
              child: Lottie.asset("assets/jsons/welcomenew.json")),
        ],
      ),
    );
  }
}
