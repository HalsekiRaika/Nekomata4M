import 'dart:async';
import 'dart:convert';

import 'package:Nekomata/DataBase/Provider/APIProvider.dart';
import 'package:Nekomata/Logger/NekomataLogger.dart';
//import 'package:http/http.dart' as http;

import 'Structure.dart';

@Deprecated("Specification Changed.")
class NekomataDataBase {
  static final String responseServerUrl   = "http://ec2-18-210-220-130.compute-1.amazonaws.com:5000/api/Raven";
  static final String collectionCheckUrl  = responseServerUrl  + "/collections/";
  static final String dataBaseHololiveC   = collectionCheckUrl +      "Hololive";
  static final String dataBaseNijisanjiC  = collectionCheckUrl +     "Nijisanji";
  static final String dataBaseAnimareC    = collectionCheckUrl +       "Animare";
  static final String dataBaseHololive    = responseServerUrl  +    "/hololive/";
  static final String dataBaseNijisanji   = responseServerUrl  +   "/nijisanji/";
  static final String dataBaseAnimare     = responseServerUrl  +     "/animare/";

  Future<List<String>> aggregateScheduledLiver(DataBase targetDataBase) async {
    List<String> castedResult = new List<String>();
    String result;

    switch (targetDataBase) {
      case DataBase.HOLOLIVE:
        result = await APIProvider.requestSearch(RequestType.ONLY_LIVER, dataBaseHololiveC);
        break;
      case DataBase.NIJISANJI:
        result = await APIProvider.requestSearch(RequestType.ONLY_LIVER, dataBaseNijisanjiC);
        break;
      case DataBase.ANIMARE:
        result = await APIProvider.requestSearch(RequestType.ONLY_LIVER, dataBaseAnimareC);
        break;
    }

    List<dynamic> decodeObjects = new List<dynamic>();
    try {
      decodeObjects = jsonDecode(result);
    } catch (excp) {
      NekomataLogger().printErr("Refactor Result", "情報の正規化に失敗しました。");
    }

    //NekomataLogger().printInfo("Refactor Result", "情報の正規化が終了しました。");
    for (dynamic item in decodeObjects) {
      castedResult.add(item);
    }

    return castedResult;
  }

  Future<List<DataBaseStructure>> aggregateData(DataBase targetDataBase,
      String targetChannel) async {
    List<DataBaseStructure> castedResult = new List<DataBaseStructure>();
    String result;

    switch (targetDataBase) {
      case DataBase.HOLOLIVE:
        result = await APIProvider.requestSearch(RequestType.DETAILS, dataBaseHololive, targetChannel);
        break;
      case DataBase.NIJISANJI:
        result = await APIProvider.requestSearch(RequestType.DETAILS, dataBaseNijisanji, targetChannel);
        break;
      case DataBase.ANIMARE:
        result = await APIProvider.requestSearch(RequestType.DETAILS, dataBaseAnimare, targetChannel);
        break;
    }

    List<dynamic> decodeObjects = new List<dynamic>();
    try {
      decodeObjects = jsonDecode(result);
    } catch (excp) {
      NekomataLogger().printErr("Refactor Result", "情報の正規化に失敗しました。");
    }

    for (Map<dynamic, dynamic> item in decodeObjects) {
      DataBaseStructure structure = DataBaseStructure.fromJson(item);
      castedResult.add(structure);
    }

    return castedResult;
  }
}
@Deprecated("Specification Changed.")
enum DataBase {
  HOLOLIVE,
  NIJISANJI,
  ANIMARE
}