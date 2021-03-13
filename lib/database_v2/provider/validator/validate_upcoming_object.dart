import 'dart:async';
import 'dart:convert';

import 'package:Nekomata/Logger/NekomataLogger.dart';
import 'package:Nekomata/database_v2/structures/structures.dart';

class UpcomingObjectValidator {
  static StreamTransformer<Grouped<String>, Grouped<UpcomingObject>> asUpcomingObjStreamConv
    = StreamTransformer<Grouped<String>, Grouped<UpcomingObject>>.fromHandlers(handleData: (value, sink) {
      try {
        for (Map<dynamic, dynamic> validateItem in jsonDecode(value.object)) {
          UpcomingObject upcoming = UpcomingObject.fromJson(validateItem);
          Logger.printInfo("validator", "Verify upcoming obj: ${upcoming.id} [${upcoming.videoId}]");
          sink.add(new Grouped(value.groupedTag, upcoming));
        }
      } on Exception catch(e) {
        Logger.printErr("validator", "Failure validate (RawString => UpcomingObject)");
        throw e;
      }
  });
}