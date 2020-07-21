import 'package:Nekomata/Widgets/NekomataHome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NekomataAppBars extends StatelessWidget {
  @override
  Widget build(BuildContext buildContext) {
    return MaterialApp(
      title: "Nekomata for Mobile",
      home: NekomataHome()
    );
  }
}