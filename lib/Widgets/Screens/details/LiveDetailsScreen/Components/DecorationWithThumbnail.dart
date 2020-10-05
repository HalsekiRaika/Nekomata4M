import 'package:Nekomata/Constants.dart';
import 'package:flutter/material.dart';

class DecorationWithThumbnail extends StatelessWidget {
  const DecorationWithThumbnail({Key key, this.size}) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.3,
      child: Stack(
        children: <Widget>[
          Container(
            height: size.height * 0.3 - 30,
            decoration: BoxDecoration(
              color: NPrimalColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
              )
            ),
          )
        ],
      ),
    );
  }
}