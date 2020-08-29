import 'dart:async';
import 'dart:convert';

import 'package:Nekomata/Logger/NekomataLogger.dart';
import 'package:http/http.dart' as http;

import 'Structure.dart';

class NekomataDataBase {
  static final String responseServerUrl   = "http://192.168.0.5:5000/api/Raven";
  static final String dataBaseHololive    = responseServerUrl + "/hololive/";
  static final String dataBaseNijisanji   = responseServerUrl + "/nijisanji/";
  static final String dataBaseAnimare     = responseServerUrl + "/animare/";

  Future<List<DataBaseStructure>> aggregateData(DataBase targetDataBase, String targetChannel) async {
    List<DataBaseStructure>    castedResult = new List<DataBaseStructure>();
    String result;

    NekomataLogger().printInfo("Connecting...", "データベースにアクセスしています…");

    switch(targetDataBase) {
      case DataBase.HOLOLIVE:
        result = await requestSearch(dataBaseHololive,  targetChannel);
        break;
      case DataBase.NIJISANJI:
        result = await requestSearch(dataBaseNijisanji, targetChannel);
        break;
      case DataBase.ANIMARE:
        result = await requestSearch(dataBaseAnimare,   targetChannel);
        break;
    }

    if (result?.isEmpty ?? true || result == null) {
      NekomataLogger().printErr("Check Result ", "サーバーからの返り値がありません！");
      return null;
    }

    NekomataLogger().printInfo("Refactor Result", "情報を正規化しています…");

    List<dynamic> decodeObjects = jsonDecode(result) as List;

    NekomataLogger().printInfo("Refactor Result", "情報の正規化が終了しました。");

    for (dynamic item in decodeObjects) {
      DataBaseStructure structure = DataBaseStructure.fromJson(item);
      castedResult.add(structure);
    }

    return castedResult;
  }

}

  Future<String> requestSearch(String uri, String targetChannel) async {
    String requestUri = uri + targetChannel;
    final responseObject = await http.get(requestUri, headers: {"Content-Type": "application/json"});
    if (responseObject.statusCode == 200) {
      NekomataLogger().printInfo("Response!    ", "Status Code: 200 [OK]");
      return responseObject.body;
    } else {
      NekomataLogger().printErr("Response!    ", "This Response is Abnormal.");
    }
  }

enum DataBase {
  HOLOLIVE,
  NIJISANJI,
  ANIMARE
}