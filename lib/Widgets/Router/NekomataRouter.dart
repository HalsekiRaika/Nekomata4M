import 'package:Nekomata/Widgets/Screens/home/HomeScreen.dart';
import 'package:flutter/material.dart';

class _ConstantProperty {
  static const String HOME    = "/home";
  //static const String LIVE_DETAILS = "/live_details";
  //static const String VIEW_DETAILS = "/view_details";
}

class NekomataRouter {
  Map<String, Widget Function(BuildContext)> routes = <String, WidgetBuilder>{
    _ConstantProperty.HOME : (BuildContext context) => HomeScreen(),
  };
}

class NekomataNavigator {
  static void vadisHome(BuildContext context) => Navigator.pushNamed(context, _ConstantProperty.HOME);
}