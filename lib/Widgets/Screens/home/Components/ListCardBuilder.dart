import 'package:Nekomata/DataBase/Structure.dart';
import 'package:Nekomata/Util/CalcAiringTimeCount.dart';
import 'package:Nekomata/Util/DateTimeFormat.dart';
import 'package:Nekomata/Widgets/Screens/details/LiveDetailsScreen/LiveDetailsScreen.dart';
import 'package:Nekomata/Widgets/Screens/home/Components/TileUpcomingCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ListCardBuilder extends StatefulWidget {
  ListCardBuilder({Key key, this.size, this.structure}) : super();

  final Size size;
  final List<DataBaseStructure> structure;
  @override
  State createState() => ListCardBuilderState(size: size, structure: structure);
}

class ListCardBuilderState extends State<ListCardBuilder> {
  ListCardBuilderState({Key key, this.size, this.structure}) : super();

  final Size size;
  final List<DataBaseStructure> structure;


  @override
  void initState() {
    reload();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        height: 280,
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return TileUpcomingCard(
                       size: size,
                   imageUrl: structure[index].thumbnailData.url,
                      title: structure[index].title.substring(0, 7) + "...",
                channelName: structure[index].channelName.substring(0, 8) + "...",
                  startTime: DateTimeFormat().set(structure[index].startTime),
                  countDown: CalcAiringTimeCount().set(structure[index].startTime),
                   function: () {
                         Navigator.push(context, MaterialPageRoute(builder: (context) => LiveDetailsScreen(),));
                   }
            );
          },
          itemCount: structure != null ? structure.length <= 6 ? structure.length : 6 : 0,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
        ),
      ),
    );
  }

  void reload() {
    setState(() {});
  }
}