import 'package:Nekomata/Constants.dart';
import 'package:Nekomata/DataBase/Provider/DataStreamProvider.dart';
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
        //DataStreamProvider().aggregateRaw(DataBase.NIJISANJI);
        //requestUpcomingSearch();
      },
    );
  }
}
