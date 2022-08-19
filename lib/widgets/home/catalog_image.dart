import 'package:flutter/material.dart';
import '../../utils/themes.dart';

class CatalogImage extends StatelessWidget {
  const CatalogImage({Key? key, required this.image}) : super(key: key);
  final String image;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        width: MediaQuery.of(context).size.width / 4,
        color: MyTheme.creamColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.network(image),
        ),
      ),
    );
  }
}
