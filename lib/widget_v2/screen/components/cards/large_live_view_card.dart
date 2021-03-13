
import 'package:nekomata/database/extractor/extractor.dart';
import 'package:nekomata/database/structures/structures.dart';
import 'package:flutter/material.dart';

class LargeLiveViewCard extends StatelessWidget {
  final UpcomingObject upcomingObj;
  const LargeLiveViewCard(this.upcomingObj, {Key key});

  @override
  Widget build(BuildContext context) {
    //final size = MediaQuery.of(context).size;
    return Container(
      //height: size.height / 2,
      //width: size.width,
      decoration: BoxDecoration(
        color: Colors.greenAccent,
        borderRadius: BorderRadius.all(
          Radius.circular(10.0)
        )
      ),
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.all(
                Radius.circular(10.0)
            ),
            child: Image.network(
                ExtractThumbnailUrl.onExtract(upcomingObj) ?? ""
            ),
          ),
          Row(
            children: [
              Container(
                child: Text(
                    upcomingObj.title.substring(0, 12),
                    style: TextStyle(fontSize: 14))),
              Text(upcomingObj.startTime, style: TextStyle(fontSize: 14))
            ],
          ),
          // <<<<<<<<<
        ],
      ),
    );
  }
}