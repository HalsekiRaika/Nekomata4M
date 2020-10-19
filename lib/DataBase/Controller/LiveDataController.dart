import 'dart:async';

import 'package:Nekomata/DataBase/Provider/DataStreamProvider.dart';
import 'package:Nekomata/DataBase/Structure.dart';

class LiveDataController {
  final StreamController<bool>
    cancelController = new StreamController<bool>();
  final StreamController<List<String>>
    rawController = new StreamController<List<String>>();
  final StreamController<List<DataBaseStructure>>
    structureController = new StreamController<List<DataBaseStructure>>();

  Stream<bool>       get cancelEffundam => cancelController.stream;
  StreamSink<bool>   get cancelCapturam => cancelController.sink;

  Stream<List<String>>     get rawEffundam    => rawController.stream;
  StreamSink<List<String>> get rawCapturam    => rawController.sink;

  Stream<List<DataBaseStructure>>     get effundam => structureController.stream;
  StreamSink<List<DataBaseStructure>> get capturam => structureController.sink;

  int count = 0;
  List<DataBaseStructure> buf = new List<DataBaseStructure>();

  LiveDataController() {
    rawEffundam
      .transform(DataStreamProvider().streamTransformer())
      .listen((event) {
        for(DataBaseStructure eventObj in event) {
          print("Streamed ${eventObj.title}");
        }
        capturam.add(event);
      }
    );

    //effundam.listen((event) { });
  }

  void dataSearch(DataBase database) {
    DataStreamProvider().aggregateRaw(database);
  }
  
  void dispose() {
    cancelController.close();
    rawController.close();
    structureController.close();
  }
}