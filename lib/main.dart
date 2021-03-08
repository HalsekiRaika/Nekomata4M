import 'package:Nekomata/DataBase/Model/CollectorModel.dart';
import 'package:Nekomata/Widgets/Router/NekomataRouter.dart';
import 'package:Nekomata/Constants.dart';
import 'package:Nekomata/Widgets/Screens/splash/SplashScreen.dart';
import 'package:Nekomata/widget_v2/screen/screen_with_navi.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;

import 'DataBase/Model/LiveModel.dart';
import 'DataBase/Model/ScreenModel.dart';


Future main() async {
  await DotEnv.load();
  runApp(NekomataV2());
} //runApp(Nekomata());

class NekomataV2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider<ScreenModel>(
          create: (context) => ScreenModel()
      ),
      ChangeNotifierProvider<LiveModel>(
          create: (context) => LiveModel()
      ),
      ChangeNotifierProvider<CollectorModel>(
          create: (context) => CollectorModel()
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