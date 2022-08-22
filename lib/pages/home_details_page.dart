import 'package:flutter/material.dart';
import 'package:flutter_master_course/package/myvx.dart';
import '../models/catalog.dart';

class HomeDetailPage extends StatelessWidget {
  const HomeDetailPage({Key? key, required this.catalog}) : super(key: key);
  final Item catalog;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Theme.of(context).canvasColor,
      bottomNavigationBar: Container(
        color: Theme.of(context).cardColor,
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
                    color: Vx.red800),
                textScaleFactor: 1.5,
              ),
              SizedBox(
                height: 50,
                width: 100,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text("Buy"),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Theme.of(context).buttonColor),
                      shape: MaterialStateProperty.all(const StadiumBorder())),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
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
                color: Theme.of(context).cardColor,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 45.0),
                  child: Column(
                    children: [
                      Text(
                        catalog.name,
                        textScaleFactor: 1.3,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).accentColor,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        catalog.desc,
                        style: TextStyle(
                          fontSize: 15,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 32),
                        child: Text(
                          "Clita et dolore ipsum rebum lorem nonumy stet. Dolores dolor elitr vero dolor erat magna lorem et sed, et no diam diam accusam ipsum, eos no aliquyam amet.",
                          style: TextStyle(
                              fontSize: 10,
                              color: Theme.of(context).primaryColor),
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
    );
  }
}
