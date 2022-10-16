import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../.././utils/themes.dart';

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({Key? key}) : super(key: key);

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
            PopupMenuButton(
                itemBuilder: (BuildContext context) => [
                      PopupMenuItem(
                          child: Column(
                        children: [
                          IconButton(
                              // iconSize: 10,
                              onPressed: () {
                                Get.changeTheme(MyTheme.themedata(context));
                              },
                              icon: const Icon(Icons.wb_sunny_outlined)),
                          IconButton(
                              // iconSize: 10,
                              splashRadius: 10,
                              onPressed: () {
                                Get.changeTheme(MyTheme.darkThemeData(context));
                              },
                              icon: const Icon(Icons.wb_sunny)),
                        ],
                      ))
                    ])
          ],
        ),
        const Text(
          "Trending Products",
        ),
      ],
    );
  }
}
