import 'package:flutter/material.dart';
import 'package:flutter_master_course/package/vx_arc.dart';
import '../../utils/themes.dart';
import '../models/catalog.dart';

class HomeDetailPage extends StatelessWidget {
  const HomeDetailPage({Key? key, required this.catalog}) : super(key: key);
  final Item catalog;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: ButtonBar(
            alignment:
                MainAxisAlignment.spaceBetween, //space betweem price and button
            buttonPadding: EdgeInsets.zero,
            children: [
              Text(
                "\$${catalog.price.toString()}",
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Color.fromARGB(255, 128, 18, 10)),
                textScaleFactor: 1.5,
              ),
              SizedBox(
                height: 50,
                width: 100,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text("Buy"),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(MyTheme.darkBluish),
                      shape: MaterialStateProperty.all(const StadiumBorder())),
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: MyTheme.creamColor,
      ),
      body: SafeArea(
        child: SafeArea(
          bottom: false,
          child: Column(children: [
            Hero(
                tag: Key(catalog.id.toString()),
                child: SizedBox(
                    height: MediaQuery.of(context).size.height / 3,
                    child: Image.network(catalog.image))),
            Expanded(
              child: VxArc(
                height: 30,
                arcType: VxArcType.CONVEY,
                edge: VxEdge.TOP,
                child: Container(
                  width: double.infinity,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 64.0),
                    child: Column(
                      children: [
                        Text(
                          catalog.name,
                          textScaleFactor: 1.3,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: MyTheme.darkBluish,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          catalog.desc,
                          style: TextStyle(
                            fontSize: 15,
                            color: MyTheme.transprent,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 32),
                          child: Text(
                            "Clita et dolore ipsum rebum lorem nonumy stet. Dolores dolor elitr vero dolor erat magna lorem et sed, et no diam diam accusam ipsum, eos no aliquyam amet.",
                            style: TextStyle(
                                fontSize: 10, color: MyTheme.transprent),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
