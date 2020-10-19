import 'dart:async';

import 'package:Nekomata/DataBase/Structure.dart';

class UpcomingObjectController {
  final StreamController _streamController = StreamController<List<DataBaseStructure>>();

  Function(List<DataBaseStructure>) get effundam => _streamController.sink.add;
  Stream<List<DataBaseStructure>>   get capturam => _streamController.stream;

  UpcomingObjectController(){
    _streamController.stream.listen((event) {

    });
  }

  void dispose() {
    _streamController.close();
  }
}