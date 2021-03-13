import 'dart:convert';

import 'package:Nekomata/Logger/NekomataLogger.dart';
import 'package:Nekomata/database_v2/structures/structures.dart';

class ExtractLiveData {
  static UpcomingObject onExtract(CachedObject cachedObj) {
    return UpcomingObject.fromJson(jsonDecode(cachedObj.rawUpcomingModel));
  }

  static List<UpcomingObject> onExtractAsList(List<CachedObject> cachedObjects) {
    List<UpcomingObject> results = [];
    cachedObjects.forEach((element) {
      Logger.printInfo("extractor", "Extract live data. from [${element.databaseId}]");
      results.add(onExtract(element));
    });
    return results;
  }
}