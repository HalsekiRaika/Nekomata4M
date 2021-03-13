import 'dart:convert';

import 'package:nekomata/Logger/NekomataLogger.dart';
import 'package:nekomata/database/database.dart';

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