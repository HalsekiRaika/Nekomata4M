import 'package:nekomata/Logger/NekomataLogger.dart';
import 'package:nekomata/database/model/models.dart';
import 'package:nekomata/database/provider/provider.dart';
import 'package:nekomata/database/structures/structures.dart';
import 'package:nekomata/database/types/types.dart';
import 'package:http/http.dart' as HTTP;
import 'package:nekomata/database/settings.dart' as Settings;

class DataBaseProvider {
  static Future<void> onRequest(ProductType type) async {
    //print(Settings.getServerUrl);
    switch (type) {
      case ProductType.HOLOLIVE:
        await _requestHandler(ProductType.HOLOLIVE.getStringProperty);
        break;
      case ProductType.NIJISANJI:
        await _requestHandler(ProductType.NIJISANJI.getStringProperty);
        break;
      case ProductType.ANIMARE:
        await _requestHandler(ProductType.ANIMARE.getStringProperty);
        break;
    }
    //await CacheStream.dispose();
  }

  static Future<void> onRequestAll() async {
    ProductMaps.getProductTypeMap.forEach((key, value) async {
      await _requestHandler(value);
    });
  }

  static Future<void> _requestHandler(String dbName) async {
    CacheStream stream = new CacheStream();
    ModelScheduledLive().deleteAll();
    stream.wakeUp();
    Stream<String> liver = UpcomingLiverValidator
        .onValidate(await _getLiverRawData(dbName)
        .onError((error, stackTrace) => null));
    await for (String collName in liver) {
      String result = await _getRawDetailData(dbName, collName);
      Grouped<String> wrapped = Grouped.of(dbName.getProductTypeProperty(), result);
      stream.inputRawStream.add(wrapped);
    }
    //await stream.dispose();
  }

  static Future<String> _getLiverRawData(String dbName) async {
    HTTP.Response res = await HTTP.get(
      await Settings.buildServerCheckUrl(dbName),
      headers: {"Content-Type": "application/json"}
    );
    Logger.asyncPrintInfo("http_request", "Getting raw Data [$dbName]");
    return res.statusCode != 200
        ? Future.error("cannot get liver raw data.")
        : Future<String>.value(res.body);
  }

  static Future<String> _getRawDetailData(String dbName, String collName) async {
    HTTP.Response res = await HTTP.get(
      await Settings.buildServerCollUrl(dbName, collName),
      headers: {"Content-Type": "application/json"}
    );
    Logger.asyncPrintInfo("http_request",
        "Getting raw Data [$dbName:::${collName.padRight(15)}]");
    return res.statusCode != 200
        ? Future.error("cannot get detail raw data.")
        : Future<String>.value(res.body);
  }

}
