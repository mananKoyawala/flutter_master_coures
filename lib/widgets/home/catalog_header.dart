import 'package:flutter/material.dart';

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Catalog App",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 30,
            color: Theme.of(context).accentColor,
          ),
        ),
        const Text(
          "Trending Products",
        ),
      ],
    );
  }
}
