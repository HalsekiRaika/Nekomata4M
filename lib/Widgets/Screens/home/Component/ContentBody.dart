import 'package:Nekomata/DataBase/Buffer/DataBuffer.dart';
import 'package:Nekomata/DataBase/Structure.dart';
import 'package:Nekomata/Widgets/Screens/home/Component/ListCardBuilder.dart';
import 'package:flutter/material.dart';

// Components
import 'HeaderSearchBox.dart';
import 'TileUpcomingCard.dart';
import 'TitleWithViewButtonComp.dart';

class ContentBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          HeaderSearchBox(size: size),
          TitleWithViewButton(text: "Airing Soon", function: (){}),
          ListCardBuilder(size: size, structure: DataBuffer.structureList),
        ],
      )
    );
  }
}

