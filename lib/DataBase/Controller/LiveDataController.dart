import 'dart:async';
import 'dart:convert';

import 'package:Nekomata/DataBase/Local/CacheAccessService.dart';
import 'package:Nekomata/DataBase/Local/CacheInterface.dart';
import 'package:Nekomata/DataBase/Model/LiveModel.dart';
import 'package:Nekomata/DataBase/Provider/DataStreamProvider.dart';
import 'package:Nekomata/DataBase/Structure.dart';
import 'package:Nekomata/DataBase/Types/AccessType.dart';

class LiveDataController {
  final StreamController<bool>
    cancelController = new StreamController<bool>();
  final StreamController<List<String>>
    rawController = new StreamController<List<String>>();
  final StreamController<List<CacheStructure>>
    structureController = new StreamController<List<CacheStructure>>();

  Stream<bool>       get cancelEffundam => cancelController.stream;
  StreamSink<bool>   get cancelCapturam => cancelController.sink;

  Stream<List<String>>     get rawInfluunt => rawController.stream;
  StreamSink<List<String>> get rawEffundam => rawController.sink;

  Stream<List<CacheStructure>>     get influunt => structureController.stream;
  StreamSink<List<CacheStructure>> get effundam => structureController.sink;

  int count = 0;
  List<DataBaseStructure> buf = [];

  LiveDataController() {
    rawInfluunt
      .transform(DataStreamProvider().streamTransformer())
      .listen((event) {
        for(CacheStructure eventObj in event) {
          print("Streamed ${DataBaseStructure.fromJson(jsonDecode(eventObj.upcomingStructure)).title}");
          LiveModel().add(eventObj);
        }
        effundam.add(event);
      }
    );
    //effundam.listen((event) { });
  }

  static void dataRetrieve(AccessType type) {
    LiveModel().deleteAll();
    DataStreamProvider().aggregateRaw(type);
  }
  
  void dispose() {
    cancelController.close();
    rawController.close();
    structureController.close();
  }
}