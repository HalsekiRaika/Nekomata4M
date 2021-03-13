import 'package:Nekomata/database_v2/structures/structures.dart';
import 'package:Nekomata/database_v2/types/notify_type.dart';
import 'package:Nekomata/database_v2/types/product_type.dart';
import 'package:Nekomata/database_v2/provider/cache/cache_service.dart';
import 'package:flutter/material.dart';

class ModelScheduledLive with ChangeNotifier {
  List<CachedObject> _scheduledLive = List.empty(growable: true);
  List<CachedObject> get allScheduledLive => _scheduledLive;
  List<CachedObject> get notifyScheduledLive
    => _scheduledLive.where((liveData) => liveData.canNotify   != NotifyType.NO_NOTIFY).toList();
  List<CachedObject> get hololiveScheduledLive
    => _scheduledLive.where((liveData) => liveData.productType == ProductType.HOLOLIVE).toList();
  List<CachedObject> get nijisanjiScheduledLive
    => _scheduledLive.where((liveData) => liveData.productType == ProductType.NIJISANJI).toList();
  List<CachedObject> get animareScheduledLive
    => _scheduledLive.where((liveData) => liveData.productType == ProductType.ANIMARE).toList();

  final cacheInterface = CacheInterface();

  ModelScheduledLive() {
    _retrieveAllFromLocalDb();
  }

  void _retrieveAllFromLocalDb() async {
    _scheduledLive = await cacheInterface.getAll();
    notifyListeners();
  }

  void add(CachedObject cacheObj) async {
    await cacheInterface.insert(cacheObj);
    _retrieveAllFromLocalDb();
  }

  void deleteAll() async {
    await cacheInterface.deleteAll();
  }
}