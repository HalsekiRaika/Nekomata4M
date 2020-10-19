import 'package:Nekomata/DataBase/Controller/LiveDataController.dart';
import 'package:Nekomata/DataBase/Structure.dart';
import 'package:Nekomata/Util/CalcAiringTimeCount.dart';
import 'package:Nekomata/Util/DateTimeFormat.dart';
import 'package:Nekomata/Widgets/Screens/details/LiveDetailsScreen/LiveDetailsScreen.dart';
import 'package:flutter/material.dart';

import 'TileUpcomingCard.dart';

class StreamDisplayCard extends StatefulWidget {
  @override
  State createState() => StreamDisplayBLoC();
}

class StreamDisplayBLoC extends State<StreamDisplayCard> {
  StreamDisplayBLoC({Key key, this.size}) : super();

  final Size size;

  @override
  Widget build(BuildContext context) {
    //final LiveDataController bloc = Provider.of(context);
    return StreamBuilder<List<DataBaseStructure>>(
      stream: LiveDataController().effundam,
      builder: (context, AsyncSnapshot<List<DataBaseStructure>> snapshot) {
        if (snapshot == null) {
          print("object is null");
          return SizedBox(
            height: 150,
            child: CircularProgressIndicator(),
          );
        }
        return SingleChildScrollView(
          child: SizedBox(
            height: 200,
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return TileUpcomingCard(
                           size: size,
                       imageUrl: snapshot.data[index].thumbnailData.url,
                          title: snapshot.data[index].title.substring(0, 7) + "...",
                    channelName: snapshot.data[index].channelName.substring(0, 8) + "...",
                      startTime: DateTimeFormat().set(snapshot.data[index].startTime),
                      countDown: CalcAiringTimeCount().set(snapshot.data[index].startTime),
                    function: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LiveDetailsScreen(),));
                    }
                );
              },
              itemCount: snapshot.data != null ? snapshot.data.length <= 6 ? snapshot.data.length : 6 : 0,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
            ),
          ),
        );
      }
    );
  }
}