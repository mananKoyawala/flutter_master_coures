import 'package:flutter/material.dart';
import 'package:flutter_master_course/utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        //set changeButton to true so button animate when press
        changeButton = true;
      });
      await Future.delayed(const Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        //set changeButton to false so button with real state
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Image.asset(
                "assets/images/image_hey.png",
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Welcome $name",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                child: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        hintText: "Enter Username",
                        label: Text(
                          "Username",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          name = value;
                        });
                      },
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return "Username Cannot be empty";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: "Enter Password",
                        label: Text(
                          "Password",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return "Password Cannot be empty";
                        } else if (value != null && value.length < 6) {
                          return "Password length should be atleast 6";
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Material(
                borderRadius: changeButton
                    ? BorderRadius.circular(50)
                    : BorderRadius.circular(10),
                color: Colors.deepPurple,
                child: InkWell(
                  // splashColor: const Color.fromARGB(0, 255, 255, 255),
                  borderRadius: BorderRadius.circular(10),
                  onTap: () => moveToHome(context),
                  child: AnimatedContainer(
                    alignment: Alignment.center,
                    height: 50,
                    width: changeButton ? 50 : 120,
                    child: changeButton
                        ? const Icon(
                            Icons.done,
                            color: Colors.white,
                          )
                        : const Text(
                            "Login",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                    duration: const Duration(seconds: 1),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
