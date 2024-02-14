import 'package:flutter/material.dart';
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
                color: Theme.of(context).highlightColor,
              ),
            ),
            // Switch(value: true, onChanged: (onChanged) {})
            IconButton(
                // iconSize: 10,
                onPressed: () {
                  ThemeServices().switchTheme();
                },
                icon: ThemeServices().theme == ThemeMode.light
                    ? const Icon(Icons.dark_mode)
                    : const Icon(Icons.light_mode)),
          ],
        ),
        Text(
          "Trending Products",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: Theme.of(context).highlightColor,
          ),
        ),
      ],
    );
  }
}
