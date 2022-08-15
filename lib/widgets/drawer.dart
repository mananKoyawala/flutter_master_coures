import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(padding: EdgeInsets.zero, children: const [
        UserAccountsDrawerHeader(
          accountName: Text(
            "Manan Koyawala",
          ),
          accountEmail: Text("manankoyawala5565@gmail.com"),
          currentAccountPicture: CircleAvatar(
            backgroundImage: AssetImage("assets/images/image_pro.jpg"),
          ),
        ),
        ListTile(
          leading: Icon(
            CupertinoIcons.home,
            color: Colors.deepPurple,
          ),
          title: Text("Home",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        ),
        ListTile(
          leading: Icon(
            CupertinoIcons.profile_circled,
            color: Colors.deepPurple,
          ),
          title: Text("Profile",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        ),
        ListTile(
          leading: Icon(
            CupertinoIcons.mail,
            color: Colors.deepPurple,
          ),
          title: Text("Email me",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        ),
      ]),
    );
  }
}
