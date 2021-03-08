import 'package:Nekomata/DataBase/Structure.dart';
import 'package:flutter/material.dart';

class LargeLiveViewCard extends StatelessWidget {
  final CacheStructure structure;
  const LargeLiveViewCard(this.structure, {Key key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          ClipRRect()
        ],
      ),
    );
  }
}