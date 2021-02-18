import 'dart:async';

import 'package:Nekomata/Logger/NekomataLogger.dart';
import 'package:http/http.dart' as HTTP_CLIENT;

enum RequestType {
  ONLY_LIVER,
  DETAILS
}

class APIProvider {
  /// requestSearch <br></br>
  /// @Return Future<String>  <br></br>
  /// Access to RavenAPI.
  static Future<String> requestSearch(RequestType requestMode, [String url, String channel]) async {
    Completer<String> completer = new Completer<String>();
    switch(requestMode) {
      case RequestType.ONLY_LIVER:
       // NekomataLogger().printInfo("Access...      ", "[ $url ]");
        final HTTP_CLIENT.Response response =
          await HTTP_CLIENT.get(url, headers: {"Content-Type": "application/json"});
        if (_isFineResponse(response)) {
          NekomataLogger().printInfo("Response!", "Status Code: 200 [OK]");
          completer.complete(response.body);
        } else {
          NekomataLogger().printErr("Response!", "This Response is Abnormal.");
          completer.complete(null);
        }
        break;

      case RequestType.DETAILS:
        //NekomataLogger().printInfo("Access...      ", "[ ${url + channel} ]");
        final HTTP_CLIENT.Response response =
          await HTTP_CLIENT.get(url + channel, headers: {"Content-Type": "application/json"});
        if (_isFineResponse(response)) {
          NekomataLogger().printInfo("Response!", "Status Code: 200 [OK]" + response.body.substring(9, 45));
          completer.complete(response.body);
        } else {
          NekomataLogger().printErr("Response!", "This Response is Abnormal.");
          completer.complete(null);
        }
        break;
    }
    return completer.future;
  }

  static bool _isFineResponse(HTTP_CLIENT.Response response) {
    return response.statusCode == 200 ? true : false;
  }
}