import 'dart:async';
import 'dart:convert';

import 'package:Nekomata/DataBase/ConstantURL.dart';
import 'package:Nekomata/DataBase/Controller/LiveDataController.dart';
import 'package:Nekomata/DataBase/Provider/APIProvider.dart';
import 'package:Nekomata/DataBase/Structure.dart';
import 'package:Nekomata/DataBase/Types/AccessType.dart';
import 'package:Nekomata/Logger/NekomataLogger.dart';

class DataStreamProvider {
  void aggregateRaw(AccessType type) {
    switch(type) {
      case AccessType.HOLOLIVE:
        _liveSearch(AccessType.HOLOLIVE, RequestURL.CHECK_LIVER_HOLOLIVE, RequestURL.DATABASE_HOLOLIVE);
        break;
      case AccessType.NIJISANJI:
        _liveSearch(AccessType.NIJISANJI, RequestURL.CHECK_LIVER_NIJISANJI, RequestURL.DATABASE_NIJISANJI);
        break;
      case AccessType.ANIMARE:
        _liveSearch(AccessType.ANIMARE, RequestURL.CHECK_LIVER_ANIMARE, RequestURL.DATABASE_ANIMARE);
        break;
    }
  }

  StreamTransformer<List<String>, List<CacheStructure>> streamTransformer() {
    List<CacheStructure> cachedArray = [];
    return StreamTransformer<List<String>, List<CacheStructure>>.fromHandlers(
      handleData: (value, sink) {
        for (String disParse in value) {
          List<DataBaseStructure> parsed = _TryParser.databaseStructureList(disParse);
          for(DataBaseStructure structure in parsed) {
            CacheStructure cached = CacheStructure().getDefaultProperty(AccessType.HOLOLIVE, jsonEncode(structure));
            cachedArray.add(cached);
          }
        }
        sink.add(cachedArray);
      }
    );
  }

  void initAggregate() {
    _liveSearch(AccessType.NIJISANJI, RequestURL.CHECK_LIVER_NIJISANJI, RequestURL.DATABASE_NIJISANJI);
  }

  /// @params __[checkUrl]__ Use the one with the `CHECK_LIVER` prefix in [RequestURL].
  ///
  /// @params __[databaseUrl]__ Use the one with the `DATABASE` prefix in [RequestURL].
  void _liveSearch(AccessType accessType, String checkUrl, String databaseUrl) async {
    List<String> rawDataArray = [];
    List<String> requestArray = _TryParser.stringList(await APIProvider.requestSearch(RequestType.ONLY_LIVER, checkUrl));
    for (String targetChannel in requestArray) {
      rawDataArray.add(await APIProvider.requestSearch(RequestType.DETAILS, databaseUrl, targetChannel));
    }
    LiveDataController().rawEffundam.add(rawDataArray);
  }
}

class _TryParser {
  static List<DataBaseStructure> databaseStructureList(String targetString) {
    List<DataBaseStructure> castedResult = [];
    List<dynamic>          decodeObjects = [];
    try {
      decodeObjects = jsonDecode(targetString);
    } catch (excp) {
      Logger.printErr("Refactor Result", "情報の正規化に失敗しました。");
    }

    for (Map<dynamic, dynamic> item in decodeObjects) {
      DataBaseStructure structure = DataBaseStructure.fromJson(item);
      castedResult.add(structure);
    }

    return castedResult;
  }

  static List<String> stringList(String targetString) {
    List<String>  castedResult  = [];
    List<dynamic> decodeObjects = [];
    try {
      decodeObjects = jsonDecode(targetString);
    } catch (excp) {
      Logger.printErr("Refactor Result", "情報の正規化に失敗しました。");
    }

    //NekomataLogger().printInfo("Refactor Result", "情報の正規化が終了しました。");
    for (dynamic item in decodeObjects) {
      castedResult.add(item);
    }
    return castedResult;
  }
}