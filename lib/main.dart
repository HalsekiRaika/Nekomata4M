import 'package:Nekomata/Widgets/Screens/home/HomeScreen.dart';
import 'package:Nekomata/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Nekomata());
}

class Nekomata extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: NPrimalColor,
        textTheme: Theme.of(context).textTheme.apply(bodyColor: NTextColor),
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      home: HomeScreen(),
    );
  }
}