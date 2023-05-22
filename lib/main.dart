import 'package:flutter/material.dart';
import 'package:perudo_calculator/view/perudo_page.dart';

void main() =>  runApp(const MyApp());


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Perudo Calculator",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Perudo Calculator"),
        ),
        body: const Center(
          child: PerudoPage(),
        ),
      ),
    );
  }

}


