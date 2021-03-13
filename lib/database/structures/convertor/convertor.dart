import 'dart:async';
import 'dart:convert';

import 'package:nekomata/Logger/NekomataLogger.dart';
import 'package:nekomata/database/structures/structures.dart';
import 'package:nekomata/database/types/notify_type.dart';
import 'package:nekomata/database/types/product_type.dart';

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
        Logger.printErr("convertor", "Failure convert: Upcoming[${value.object.id}] -> CachedObject\n\n");
        print(e.toString());
      }
    }
  );
}