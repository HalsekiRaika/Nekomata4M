import 'package:nekomata/widget_v2/screen/screen_with_navi.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;

import 'database/database.dart';


Future<void> main() async {
  await DotEnv.load(fileName: 'assets/.env');
  runApp(NekomataV2());
}

class NekomataV2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider<ModelScreenState>(
          create: (context) => ModelScreenState()
      ),
      ChangeNotifierProvider<ModelScheduledLive>(
          create: (context) => ModelScheduledLive()
      ),
      ChangeNotifierProvider<ModelRequestType>(
          create: (context) => ModelRequestType()
      )
    ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ScreenWithNavigate(),
      ),
    );
  }
}

/// Deprecated
/*
class Nekomata extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider<LiveModel>(
        create: (context) => LiveModel()
      )
    ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              primaryColor: NPrimalColor,
              textTheme: Theme.of(context).textTheme.apply(bodyColor: NTextColor),
              visualDensity: VisualDensity.adaptivePlatformDensity
          ),
          routes: NekomataRouter().routes,
          home: SplashScreen()
      ),
    );
  }
}

 */