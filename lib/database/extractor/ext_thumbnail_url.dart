import 'dart:convert';

import 'package:nekomata/database/database.dart';

class ExtractThumbnailUrl {
  static String onExtract(UpcomingObject upcomingObj) {
    return upcomingObj.thumbnailData.url;
  }

  static String onExtractWithJsonConv(String rawString) {
    return UpcomingObject.fromJson(jsonDecode(rawString)).thumbnailData.url;
  }
}