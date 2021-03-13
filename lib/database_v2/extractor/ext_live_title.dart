import 'dart:convert';

import 'package:Nekomata/database_v2/structures/structures.dart';

class ExtractLiveTitle {
  static String onExtract(UpcomingObject upcomingObj) {
    return upcomingObj.title;
  }

  static String onExtractWithJsonConv(String rawObj) {
    return UpcomingObject.fromJson(jsonDecode(rawObj)).title;
  }
}