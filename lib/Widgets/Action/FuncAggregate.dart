import 'package:Nekomata/Constants.dart';
import 'package:Nekomata/DataBase/Aggregater.dart';
import 'package:Nekomata/DataBase/Buffer/DataBuffer.dart';
import 'package:Nekomata/Logger/NekomataLogger.dart';
import 'package:Nekomata/Widgets/Screens/home/Components/ListCardBuilder.dart';
import 'package:flutter/material.dart';

class FuncAggregate extends StatelessWidget {
  const FuncAggregate({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: NPrimalColor,
      child: Icon(Icons.autorenew),
      onPressed: (){
        _requestUpcomingSearch();
      },
    );
  }

  void _requestUpcomingSearch() async {
    DataBuffer.structureList.clear();
    List<String> scheduledLiver = await NekomataDataBase().aggregateScheduledLiver(DataBase.NIJISANJI);
    NekomataLogger().printInfo("Detect Live    ", "${scheduledLiver.length} 個のチャンネルがライブをスケジュールしています。");
    for (String item in scheduledLiver) {
      DataBuffer.structureList.addAll(await NekomataDataBase().aggregateData(DataBase.NIJISANJI, item));
    }
    NekomataLogger().printInfo("Store Cache    ", "格納しました。 [ ${DataBuffer.structureList.length} ]/Num of ScheduledLive");
    ListCardBuilderState().initState();
  }
}
