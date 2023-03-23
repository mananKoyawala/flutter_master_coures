import 'package:flutter/material.dart';
import 'package:flutter_master_course/widgets/circularprogress.dart';

class InternetLostPage extends StatelessWidget {
  const InternetLostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        color: Theme.of(context).canvasColor,
        child: const Center(child: CircularProgress()));
  }
}
