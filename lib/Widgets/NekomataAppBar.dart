import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NekomataAppBars extends StatelessWidget {
  @override
  Widget build(BuildContext buildContext) {
    return MaterialApp(
      title: "Nekomata for Mobile",
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("Nekomata"),
          backgroundColor: Color.fromARGB(100, 194, 89, 206),
        ),
        body: Center(
          child: new Text("Hello Dart + Flutter!"),
        ),
      ),
    );
  }
}