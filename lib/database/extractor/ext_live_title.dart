import 'dart:convert';

import 'package:nekomata/database/database.dart';

class ExtractLiveTitle {
  static String onExtract(UpcomingObject upcomingObj) {
    return upcomingObj.title;
  }

  static String onExtractWithJsonConv(String rawObj) {
    return UpcomingObject.fromJson(jsonDecode(rawObj)).title;
  }
}