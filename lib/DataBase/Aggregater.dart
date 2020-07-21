import 'dart:async';

import 'package:Nekomata/Logger/NekomataLogger.dart';
import 'package:mongo_dart/mongo_dart.dart';

import 'Structure.dart';

class NekomataDataBase {

  static final String dataBaseUrl         = "mongodb://$userName:$passWord@192.168.0.5";
  static final Db     dataBaseHololive    = new Db(dataBaseUrl + "/Hololive");
  static final Db     dataBaseNijisanji   = new Db(dataBaseUrl + "/Nijisanji");
  static final Db     dataBaseAnimare     = new Db(dataBaseUrl + "/Animare");

  static final pipeLine = AggregationPipelineBuilder().build();

  Timer _cut_connection;

  Future<List<DataBaseStructure>> aggregateData(DataBase targetDataBase, String targetChannel) async {
    List<Map<String, dynamic>> result; //= new List<Map<String, dynamic>>();
    List<DataBaseStructure>    castedResult;

    NekomataLogger().printInfo("Connecting...", "データベースにアクセスしています…");

    switch(targetDataBase) {
      case DataBase.HOLOLIVE:
        await _connectDB(dataBaseHololive, targetChannel, "Hololive").then((value) => result);
        break;
      case DataBase.NIJISANJI:
        await _connectDB(dataBaseNijisanji, targetChannel, "Nijisanji").then((value) => result);
        break;
      case DataBase.ANIMARE:
        await _connectDB(dataBaseAnimare, targetChannel, "Animare").then((value) => result);
        break;
    }

    if (result?.isEmpty ?? true || result == null) {
      NekomataLogger().printErr("Check Result", "サーバーからの返り値がありません！");
      throw NullThrownError;
    }

    for(Map<String, dynamic> item in result) {
      DataBaseStructure structure = DataBaseStructure.fromJson(item);
      castedResult.add(structure);
    }

    return castedResult;
  }

  // ignore: missing_return
  Future<List<Map<String, dynamic>>> _connectDB(Db targetDataBase, String collectionName, String dataBaseName) async {
    NekomataLogger().printInfo("DB Opening...", "データベースとのアクセスを確立中。");

      _connectCompleter(targetDataBase).then((value) async {

        DbCollection collection = targetDataBase.collection(collectionName);
        NekomataLogger().printInfo("Collection Info", "接続先のデータベース：$dataBaseName");
        NekomataLogger().printInfo("Collection Info", "コレクション名　　　：$collectionName");
        _disconnectionChecker(targetDataBase);

        return await collection.aggregateToStream(pipeLine).toList();
      });

  }

  Future _connectCompleter(Db targetDataBase) {
    Completer completer = new Completer();
    if (targetDataBase.state == State.CLOSED || targetDataBase.state == State.INIT) {
      targetDataBase.open().then((value) => {
        completer.complete()
      });
    } else {
      completer.complete();
    }
    NekomataLogger().printInfo("DB Open", "データベースとのアクセスを確立。");
    return completer.future;
  }

  void _disconnectionChecker(Db targetDataBase) {
    if (_cut_connection != null && _cut_connection.isActive) {
      _cut_connection.cancel();
    } else {
      _cut_connection = new Timer(new Duration(seconds: 5), () {
        NekomataLogger().printCaut("DB Closed", "データベースとの接続を解除。");
        targetDataBase.close();
      });
    }
  }

}

enum DataBase {
  HOLOLIVE,
  NIJISANJI,
  ANIMARE
}