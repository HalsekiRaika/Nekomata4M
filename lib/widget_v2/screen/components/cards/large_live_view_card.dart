import 'package:Nekomata/database_v2/extractor/ext_thumbnail_url.dart';
import 'package:Nekomata/database_v2/structures/structures.dart';
import 'package:flutter/material.dart';

class LargeLiveViewCard extends StatelessWidget {
  final UpcomingObject upcomingObj;
  const LargeLiveViewCard(this.upcomingObj, {Key key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height / 2,
      width: size.width,
      decoration: BoxDecoration(
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
              Text(upcomingObj.title.substring(0, 10), style: TextStyle(fontSize: 11)),
              Text(upcomingObj.startTime, style: TextStyle(fontSize: 11))
            ],
          ),
          // <<<<<<<<<
        ],
      ),
    );
  }
}