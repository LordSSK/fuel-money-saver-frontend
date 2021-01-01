import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroScreen extends StatelessWidget {
  var pages = [
    PageViewModel(
      title: "Spearheads",
      bodyWidget: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text("Double tap"),
          Icon(Icons.touch_app),
          Text(" anywhere to add marker"),
        ],
      ),
      image: const Center(child: Icon(Icons.favorite,color: Colors.red,)),
    ),
    PageViewModel(
      title: "Generate Route",
      bodyWidget: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text("Click on "),
          Icon(Icons.alt_route),
          Text(" to generate Route"),
        ],
      ),
      image: const Center(child: Icon(Icons.favorite,color: Colors.red,)),
    ), PageViewModel(
      title: "Optimal Fuel Stations",
      bodyWidget: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text("Click on "),
          Icon(Icons.map),
          Text(" to get best Fuel Stations"),
        ],
      ),
      image: const Center(child: Icon(Icons.favorite,color: Colors.red,)),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
          pages: pages,
          onDone: () {
            Navigator.pushNamed(context, '/mapSelection');
          },
          done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w600))),
    );
  }
}
