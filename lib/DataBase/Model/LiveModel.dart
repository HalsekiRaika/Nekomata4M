import 'package:Nekomata/DataBase/Provider/DataStreamProvider.dart';
import 'package:Nekomata/DataBase/Structure.dart';
import 'package:flutter/material.dart';

class LiveModel with ChangeNotifier {
  List<CacheStructure> _scheduledLive = List.empty(growable: true);
  List<CacheStructure> get allScheduledLive       => _scheduledLive;
  List<CacheStructure> get notifyScheduledLive    => _scheduledLive.where((liveData) => liveData.canNotification == true).toList();
  List<CacheStructure> get hololiveScheduledLive  => _scheduledLive.where((liveData) => liveData.type == DataBase.HOLOLIVE).toList();
  List<CacheStructure> get nijisanjiScheduledLive => _scheduledLive.where((liveData) => liveData.type == DataBase.NIJISANJI).toList();
  List<CacheStructure> get animareScheduledLive   => _scheduledLive.where((liveData) => liveData.type == DataBase.ANIMARE).toList();
}