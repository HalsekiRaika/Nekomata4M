import 'dart:async';

import 'package:Nekomata/DataBase/ConstantURL.dart';
import 'package:Nekomata/Logger/NekomataLogger.dart';
import 'package:http/http.dart' as HTTP_CLIENT;

enum RequestType {
  ONLY_LIVER,
  DETAILS
}

class APIProvider {
  /// Request scheduled live search from [RequestURL.RESPONSE_SERVER_URL].<br></br>
  ///
  /// @params  __[path]__ This can be done using the Path in [RequestURL].
  ///          As an example, you can get the dbname array [raw string] of
  ///          the person who is currently scheduled to be live. [/collection/].
  ///
  /// @params  __[channel]__ Use the letters dbname here.
  ///          Mainly used only when [RequestType] is in DETAILS mode.
  ///
  /// @returns Future<String> Http GET raw [String]. <br></br>
  static Future<String> requestSearch(RequestType requestMode, [String path, String channel]) async {
    Completer<String> completer = new Completer<String>();
    switch(requestMode) {
      case RequestType.ONLY_LIVER:
        final HTTP_CLIENT.Response response =
            await HTTP_CLIENT.get(Uri.http(RequestURL.RESPONSE_SERVER_URL, path), headers: {"Content-Type": "application/json"});
          //await HTTP_CLIENT.get(Uri.dataFromString(url), headers: {"Content-Type": "application/json"});
        if (_isFineResponse(response)) {
          NekomataLogger().printInfo("Response!", "Status Code: 200 [OK]");
          completer.complete(response.body);
        } else {
          NekomataLogger().printErr("Response!", "This Response is Abnormal.");
          completer.complete(null);
        }
        break;

      case RequestType.DETAILS:
        final HTTP_CLIENT.Response response =
          await HTTP_CLIENT.get(Uri.http(RequestURL.RESPONSE_SERVER_URL, path + channel), headers: {"Content-Type": "application/json"});
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