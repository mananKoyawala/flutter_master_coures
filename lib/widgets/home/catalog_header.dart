import 'package:flutter/material.dart';
import 'package:flutter_master_course/utils/LocalStorage.dart';
import 'package:get/get.dart';
import '../.././utils/themes.dart';

class CatalogHeader extends StatefulWidget {
  const CatalogHeader({Key? key}) : super(key: key);

  @override
  State<CatalogHeader> createState() => _CatalogHeaderState();
}

class _CatalogHeaderState extends State<CatalogHeader> {
  ThemeServices s = ThemeServices();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Catalog App",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 30,
                color: Theme.of(context).accentColor,
              ),
            ),
            // Switch(value: true, onChanged: (onChanged) {})
            IconButton(
                // iconSize: 10,
                onPressed: () {
                  ThemeServices().switchTheme();
                },
                icon: ThemeServices().theme == ThemeMode.light
                    ? Icon(Icons.dark_mode)
                    : Icon(Icons.light_mode)),
            // PopupMenuButton(
            //     itemBuilder: (BuildContext context) => [
            //           PopupMenuItem(
            //               child: Column(
            //             children: [
            //               IconButton(
            //                   // iconSize: 10,
            //                   onPressed: () {
            //                     Get.changeTheme(MyTheme.themedata(context));
            //                     LocalStorage.setTheme(1);
            //                     Get.back();
            //                   },
            //                   icon: const Icon(Icons.wb_sunny_outlined)),
            //               IconButton(
            //                   // iconSize: 10,
            //                   splashRadius: 10,
            //                   onPressed: () {
            //                     Get.changeTheme(MyTheme.darkThemeData(context));
            //                     LocalStorage.setTheme(2);
            //                     Get.back();
            //                   },
            //                   icon: const Icon(Icons.wb_sunny)),
            //             ],
            //           ))
            //         ])
          ],
        ),
        const Text(
          "Trending Products",
        ),
      ],
    );
  }
}
