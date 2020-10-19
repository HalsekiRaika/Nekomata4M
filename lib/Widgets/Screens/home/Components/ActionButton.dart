import 'package:Nekomata/Constants.dart';
import 'package:Nekomata/DataBase/Controller/LiveDataController.dart';
import 'package:Nekomata/DataBase/Provider/DataStreamProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ActionButton {
  Widget widget() {
    return Consumer<LiveDataController>(
      builder: (_, bloc, child) {
        return FloatingActionButton(
          backgroundColor: NPrimalColor,
          child: child,
          onPressed: () { bloc.dataSearch(DataBase.NIJISANJI); }
        );
      },
      child: Icon(Icons.autorenew),
    );
  }
}