import 'dart:async';
import 'dart:convert';

import 'package:Nekomata/Logger/NekomataLogger.dart';
import 'package:http/http.dart' as http;

import 'Structure.dart';

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

    NekomataLogger().printInfo("Connecting...  ", "データベースにアクセスしています…");

    switch (targetDataBase) {
      case DataBase.HOLOLIVE:
        result = await _requestSearch(dataBaseHololiveC);
        break;
      case DataBase.NIJISANJI:
        result = await _requestSearch(dataBaseNijisanjiC);
        break;
      case DataBase.ANIMARE:
        result = await _requestSearch(dataBaseAnimareC);
        break;
    }

    NekomataLogger().printInfo("Refactor Result", "情報を正規化しています…");

    List<dynamic> decodeObjects = new List<dynamic>();
    try {
      decodeObjects = jsonDecode(result);
    } catch (excp) {
      NekomataLogger().printErr("Refactor Result", "情報の正規化に失敗しました。");
    }

    NekomataLogger().printInfo("Refactor Result", "情報の正規化が終了しました。");
    for (dynamic item in decodeObjects) {
      castedResult.add(item);
    }

    return castedResult;
  }

  Future<List<DataBaseStructure>> aggregateData(DataBase targetDataBase,
      String targetChannel) async {
    List<DataBaseStructure> castedResult = new List<DataBaseStructure>();
    String result;

    NekomataLogger().printInfo("Connecting...  ", "データベースにアクセスしています…");

    switch (targetDataBase) {
      case DataBase.HOLOLIVE:
        result = await _requestSearchDetail(dataBaseHololive,  targetChannel);
        break;
      case DataBase.NIJISANJI:
        result = await _requestSearchDetail(dataBaseNijisanji, targetChannel);
        break;
      case DataBase.ANIMARE:
        result = await _requestSearchDetail(dataBaseAnimare,   targetChannel);
        break;
    }

    NekomataLogger().printInfo("Refactor Result", "情報を正規化しています…");

    List<dynamic> decodeObjects = new List<dynamic>();
    try {
      decodeObjects = jsonDecode(result);
    } catch (excp) {
      NekomataLogger().printErr("Refactor Result", "情報の正規化に失敗しました。");
    }

    NekomataLogger().printInfo("Refactor Result", "情報の正規化が終了しました。");
    for (Map<dynamic, dynamic> item in decodeObjects) {
      DataBaseStructure structure = DataBaseStructure.fromJson(item);
      castedResult.add(structure);
    }

    return castedResult;
  }

  Future<String> _requestSearch(String uri) async {
    String requestUri = uri;
    final responseObject = await http.get(
        requestUri, headers: {"Content-Type": "application/json"});
    if (responseObject.statusCode == 200) {
      NekomataLogger().printInfo("Response!      ", "Status Code: 200 [OK]");
      return responseObject.body;
    } else {
      NekomataLogger().printErr(
          "Response!      ", "This Response is Abnormal.");
    }
  }

  Future<String> _requestSearchDetail(String uri, String targetChannel) async {
    String requestUri = uri + targetChannel;
    final responseObject = await http.get(
        requestUri, headers: {"Content-Type": "application/json"});
    if (responseObject.statusCode == 200) {
      NekomataLogger().printInfo("Response!      ", "Status Code: 200 [OK]");
      return responseObject.body;
    } else {
      NekomataLogger().printErr(
          "Response!      ", "This Response is Abnormal.");
    }
  }
}
enum DataBase {
  HOLOLIVE,
  NIJISANJI,
  ANIMARE
}