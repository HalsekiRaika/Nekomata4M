import 'package:nekomata/Logger/NekomataLogger.dart';
import 'package:nekomata/widget_v2/screen/home/screen_favorite.dart';
import 'package:nekomata/widget_v2/screen/home/screen_notification.dart';
import 'package:nekomata/widget_v2/screen/home/screen_topic.dart';
import 'package:flutter/material.dart';

class ModelScreenState with ChangeNotifier {
  final List<Widget> _screens = [
    ScreenTopic(),
    ScreenFavorite(),
    ScreenNotification()
  ];

  int _screenIndex = 1;
  int get getScreenIndex => _screenIndex;

  void changeScreen(int index) {
    _screenIndex = index;
    notifyListeners();
    Logger.printInfo("screen", "Change index: $index");
  }

  Widget getScreen() {
    Logger.printInfo("screen", "Get Screen: $getScreenIndex");
    return _screens[getScreenIndex];
  }
}