import 'dart:convert';

import 'package:Nekomata/Logger/NekomataLogger.dart';

class UpcomingLiverValidator {
  static Stream<String> onValidate(String rawString) async* {
    try {
      for (dynamic liver in await jsonDecode(rawString)) {
        yield liver;
      }
    } on Exception catch(e) {
      Logger.printErr("validator", "Failure validate ([RawString] => List<String>)");
    }
  }
}