import 'dart:async';

import 'package:Nekomata/Logger/NekomataLogger.dart';
import 'package:mongo_dart/mongo_dart.dart';

import 'Structure.dart';

class NekomataDataBase {
  static final String dataBaseUrl         = "mongodb://$userName:$passWord@192.168.0.5";
  static final Db     dataBaseHololive    = new Db(dataBaseUrl + "Hololive");
  static final Db     dataBaseNijisanji   = new Db(dataBaseUrl + "Nijisanji");
  static final Db     dataBaseAnimare     = new Db(dataBaseUrl + "Animare");

  static final pipeLine = AggregationPipelineBuilder().build();

  Future<List<DataBaseStructure>> aggregateData(DataBase targetDataBase, String targetChannel) async {
    List<Map<String, dynamic>> result;
    List<DataBaseStructure>    castedResult;

    NekomataLogger().printInfo("Connecting...", "データベースにアクセスしています…");

    switch(targetDataBase) {
      case DataBase.HOLOLIVE:
        result = await _connectDB(dataBaseHololive, targetChannel, "Hololive");
        break;
      case DataBase.NIJISANJI:
        result = await _connectDB(dataBaseNijisanji, targetChannel, "Nijisanji");
        break;
      case DataBase.ANIMARE:
        result = await _connectDB(dataBaseAnimare, targetChannel, "Animare");
        break;
    }

    if (!result.isNotEmpty) {
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
    try {
      await targetDataBase.open(); // DB OPEN

      NekomataLogger().printInfo("DB Open", "データベースとのアクセスを確立。");
      NekomataLogger().printInfo("Collection Info", "接続先のデータベース：$dataBaseName");
      NekomataLogger().printInfo("Collection Info", "コレクション名　　　：$collectionName");

      DbCollection collection = targetDataBase.collection(collectionName);

      return await collection.aggregateToStream(pipeLine).toList();

    } catch (Exception) {
      NekomataLogger().printErr("DB Connection Error", "データベースとのアクセスに失敗。" + "\n");
      NekomataLogger().printErr("StackTrace", "===================== Crash Log =====================" + "\n");
      print(Exception);
    }
  }

}

enum DataBase {
  HOLOLIVE,
  NIJISANJI,
  ANIMARE
}