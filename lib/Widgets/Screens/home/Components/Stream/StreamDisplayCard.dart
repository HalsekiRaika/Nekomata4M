import 'package:Nekomata/DataBase/Controller/LiveDataController.dart';
import 'package:Nekomata/DataBase/Structure.dart';
import 'package:Nekomata/Util/CalcAiringTimeCount.dart';
import 'package:Nekomata/Util/DateTimeFormat.dart';
import 'package:Nekomata/Widgets/Screens/details/LiveDetailsScreen/LiveDetailsScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../TileUpcomingCard.dart';

class StreamDisplayCard extends StatefulWidget {
  @override
  State createState() => StreamDisplayBLoC();
}

class StreamDisplayBLoC extends State<StreamDisplayCard> {
  StreamDisplayBLoC({Key key, this.size, this.snapshot}) : super();

  final Size size;
  final List<DataBaseStructure> snapshot;

  @override
  Widget build(BuildContext context) {
    //final List<DataBaseStructure> snapshot = Provider.of<List<DataBaseStructure>>(context);
    //print(snapshot[0].title);
    return SingleChildScrollView(
      child: SizedBox(
        height: 200,
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return TileUpcomingCard(
                size: size,
                imageUrl: snapshot[index].thumbnailData.url,
                title: snapshot[index].title.substring(0, 7) + "...",
                channelName: snapshot[index].channelName.substring(0, 8) + "...",
                startTime: DateTimeFormat().set(snapshot[index].startTime),
                countDown: CalcAiringTimeCount().set(snapshot[index].startTime),
                function: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LiveDetailsScreen(),));
                }
            );
          },
          itemCount: snapshot != null ? snapshot.length <= 6 ? snapshot.length : 6 : 1, //　I try changed 0 to 1.
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
        ),
      ),
    );
  }

  @override
  void dispose() {
    LiveDataController().dispose();
    super.dispose();
  }
}