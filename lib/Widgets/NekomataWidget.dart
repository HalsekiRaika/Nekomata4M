import 'package:Nekomata/DataBase/Structure.dart';
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
          centerTitle: true,
          backgroundColor: Color.fromARGB(1000, 194, 89, 206),
        ),
        body: Column(
          children: <Widget>[

          ],
        ),
        backgroundColor: Color.fromARGB(1000, 237, 223, 245),
      ),
    );
  }

  ListTile _listUpcomingTile (DataBaseStructure structure) {

  }
}