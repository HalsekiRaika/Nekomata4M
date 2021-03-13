import 'dart:async';

import 'package:nekomata/Logger/NekomataLogger.dart';
import 'package:nekomata/database/database.dart';

/// Using StreamTransformer, raw data retrieved from WebAPI is sequentially
/// transformed into data to be stored in LocalDB and stored.
//  ============================================================
///  WebAPI              ScheduledData             localdb
/// [String] >>Decode>> [UpcomingObject] >>Wrap>> [CachedObject]
//  ============================================================
//
//  Also, we can validate the data here at the same time,
//  so perhaps we can get some certainty...?
class CacheStream {
  // WebAPI raw data
  static final _rawStream = new StreamController<Grouped<String>>();
  // rawData >>Decode>> ScheduledData with Validator
  static final Stream<Grouped<UpcomingObject>> _transUpcomingStream
    = _rawStream.stream.transform(UpcomingObjectValidator.asUpcomingObjStreamConv);
  // ScheduledData >>Wrap>> CachedObject and Store LocalDB
  final Stream<CachedObject> _transCachedStream
    = _transUpcomingStream.transform(Convertor.asCachedObjStreamConv);

  StreamSink<Grouped<String>> get inputRawStream => _rawStream.sink;
  //Stream<CachedObject> get cachedStream => _transCachedStream;

  CacheStream() {
    //wakeUp();
  }

  Future<void> wakeUp() async {
    if (!_rawStream.hasListener) {
      await Logger.asyncPrintInfo("cache_stream", "Start listen.");
      _transCachedStream.listen((event) {
        Logger.printInfo("cache_stream", "Streamed " + ExtractLiveTitle.onExtractWithJsonConv(event.rawUpcomingModel));
        ModelScheduledLive().add(event);
        Logger.printInfo("cache_stream", "Stored data.");
      });
    } else {
      await Logger.asyncPrintWarn("cache_stream", "Stream has already listener");
      return;
    }
  }

  Future<void> pause() async {
    if (!_rawStream.isPaused) {
      _rawStream.onPause();
    }
  }

  Future<void> dispose() async {
    if (_rawStream.hasListener) {
      await Logger.asyncPrintInfo("cache_stream", "Disposing listen.");
      await _rawStream.close().then((value) => "close stream");
      await Logger.asyncPrintInfo("cache_stream", "Disposed");
    } else {
      await Logger.asyncPrintCaut("cache_stream", "Cannot dispose...");
      return;
    }
  }
}