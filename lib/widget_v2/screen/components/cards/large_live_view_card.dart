import 'package:flutter/cupertino.dart';
import 'package:nekomata/readable/time_count.dart';
import 'package:nekomata/database/extractor/extractor.dart';
import 'package:nekomata/database/structures/structures.dart';
import 'package:flutter/material.dart';
import 'package:nekomata/readable/time_format.dart';

class LargeLiveViewCard extends StatelessWidget {
  final UpcomingObject upcomingObj;
  const LargeLiveViewCard(this.upcomingObj, {Key key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
                margin: EdgeInsets.symmetric(horizontal: 8.0),
                width: size.width * 0.65,
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                          upcomingObj.title.substring(0, 20),
                          style: TextStyle(fontSize: 14),
                          softWrap: true,
                          maxLines: 1,
                        ),
                    ),
                    Container(child: Text(upcomingObj.channelName, style: TextStyle(fontSize: 14),)),
                  ],
                ),
              ),

              Expanded(
                child: Container(
                  height: size.height * 0.08,
                    decoration: BoxDecoration(
                        color: Colors.green.shade300,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0)
                        )
                    ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(child: Text(DateTimeFormat.onFormat(upcomingObj.startTime)),),
                        Center(child: Text(TimeCount.onCalc(upcomingObj.startTime) ?? "!ERR!")),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          // <<<<<<<<<
        ],
      ),
    );
  }
}