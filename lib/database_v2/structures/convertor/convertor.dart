import 'dart:async';
import 'dart:convert';

import 'package:Nekomata/Logger/NekomataLogger.dart';
import 'package:Nekomata/database_v2/structures/structures.dart';
import 'package:Nekomata/database_v2/types/notify_type.dart';
import 'package:Nekomata/database_v2/types/product_type.dart';

class Convertor {
  static StreamTransformer<Grouped<UpcomingObject>, CachedObject> asCachedObjStreamConv
    = StreamTransformer.fromHandlers(handleData: (value, sink) {
      try {
        CachedObject trans = CachedObject(value.groupedTag,
            jsonEncode(value.object.toJson()),
            databaseId: value.object.id.substring(0, 8),
            notifyCount: 0,
            canNotify: NotifyType.NO_NOTIFY);
        Logger.printInfo("convertor",
            "Cache trans successfully: ${value.object.id}"
            " (bind ${value.groupedTag.getStringProperty})");
        sink.add(trans);
      } on Exception catch(e) {
        Logger.printErr("convertor", "Failure convert: Upcoming[${value.object.id}] -> CachedObject");
      }
    }
  );
}