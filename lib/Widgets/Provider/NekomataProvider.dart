import 'package:Nekomata/DataBase/Controller/LiveDataController.dart';
import 'package:flutter/material.dart';

class NekomataProvider extends InheritedWidget {
  const NekomataProvider({Key key, Widget child})
      : super(key: key, child: child);

  LiveDataController get blocUpcoming => LiveDataController();

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static NekomataProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<NekomataProvider>();
  }
}