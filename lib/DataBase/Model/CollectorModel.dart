import 'package:Nekomata/DataBase/Types/AccessType.dart';
import 'package:Nekomata/Logger/NekomataLogger.dart';
import 'package:flutter/material.dart';

class CollectorModel with ChangeNotifier {
  AccessType _accessType     = AccessType.HOLOLIVE;
  int get getAccessTypeIndex => _accessType.index;

  void changeAccessType(AccessType accessType) {
    _accessType = accessType;
    notifyListeners();
    Logger.printInfo(
        "access_type", "Change type: ${accessType.toString()}");
  }

  void changeAccessTypeFromIndex(int index) {
    AccessType type = AccessType.values.where((t) => t.index == index).toList()[0];
    notifyListeners();
    Logger.printInfo(
        "access_type", "Change type: ${type.toString()}");
  }

  AccessType getAccessType() {
    Logger.printInfo(
        "access_type", "Get AccessType: $getAccessTypeIndex");
    return _accessType;
  }

}