import 'dart:convert';

import 'package:Nekomata/database_v2/structures/structures.dart';

class ExtractThumbnailUrl {
  static String onExtract(UpcomingObject upcomingObj) {
    return upcomingObj.thumbnailData.url;
  }

  static String onExtractWithJsonConv(String rawString) {
    return UpcomingObject.fromJson(jsonDecode(rawString)).thumbnailData.url;
  }
}