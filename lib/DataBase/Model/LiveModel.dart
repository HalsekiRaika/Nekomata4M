import 'package:Nekomata/DataBase/Local/CacheInterface.dart';
import 'package:Nekomata/DataBase/Provider/DataStreamProvider.dart';
import 'package:Nekomata/DataBase/Structure.dart';
import 'package:Nekomata/DataBase/Types/AccessType.dart';
import 'package:flutter/material.dart';

class LiveModel with ChangeNotifier {
  List<CacheStructure> _scheduledLive = List.empty(growable: true);
  List<CacheStructure> get allScheduledLive       => _scheduledLive;
  List<CacheStructure> get notifyScheduledLive    => _scheduledLive.where((liveData) => liveData.canNotification == true).toList();
  List<CacheStructure> get hololiveScheduledLive  => _scheduledLive.where((liveData) => liveData.type == AccessType.HOLOLIVE).toList();
  List<CacheStructure> get nijisanjiScheduledLive => _scheduledLive.where((liveData) => liveData.type == AccessType.NIJISANJI).toList();
  List<CacheStructure> get animareScheduledLive   => _scheduledLive.where((liveData) => liveData.type == AccessType.ANIMARE).toList();

  final cacheInterface = CacheInterface();

  LiveModel() {
    _retrieveAll();
  }

  void _retrieveAll() async {
    _scheduledLive = await cacheInterface.getAll();
    notifyListeners();
  }

  void add(CacheStructure cacheObj) async {
    await cacheInterface.insert(cacheObj);
    _retrieveAll();
  }

  void deleteAll() async {
    await cacheInterface.deleteAll();
  }
}