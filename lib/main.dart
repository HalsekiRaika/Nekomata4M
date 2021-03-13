import 'package:Nekomata/Widgets/Router/NekomataRouter.dart';
import 'package:Nekomata/Constants.dart';
import 'package:Nekomata/Widgets/Screens/splash/SplashScreen.dart';
import 'package:Nekomata/database_v2/model/model_request_type.dart';
import 'package:Nekomata/widget_v2/screen/screen_with_navi.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;

import 'DataBase/Model/LiveModel.dart';
import 'database_v2/model/models.dart';


Future<void> main() async {
  await DotEnv.load(fileName: 'assets/.env');
  runApp(NekomataV2());
} //runApp(Nekomata());

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