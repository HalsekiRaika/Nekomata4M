import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;

const bool DEBUG_MODE = true;

// Base Information
final String _server = DEBUG_MODE ? DotEnv.env['LOCAL_SERVER'] : DotEnv.env['PUBLIC_SERVER'];
const String _PATH   = "nekomata/v1/api";

// Suffix
const String _COLL   = "upcoming";
const String _CHECK  = "upcoming_liver";

Future<Uri> buildServerCollUrl(String dbName, String collName) async
  => Uri.http(_server, "/$_PATH/$_COLL/$dbName/$collName");
Future<Uri> buildServerCheckUrl(String dbName) async
  => Uri.http(_server, "/$_PATH/$_CHECK/$dbName");
String get getServerUrl => "$_server/$_PATH";