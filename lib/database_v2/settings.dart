import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;

const bool DEBUG_MODE = true;

final String _SERVER = DEBUG_MODE ? DotEnv.env['LOCAL_SERVER'] : DotEnv.env['PUBLIC_SERVER'];