import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class StatelessSplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                  flex: 2,
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 140,
                          child: SvgPicture.asset("assets/NekomataF.svg", width: 180, height: 180,),
                        ),
                        Padding(padding: EdgeInsets.only(top: 10.0)),
                        Text(" VTuber \n Scheduled Live \n Quick Notification Service",style: TextStyle(fontSize: 10.0, color: Colors.black26),),
                        Text("© 2020 ReiRokusanami", style: TextStyle(fontSize: 10.0, color: Colors.black26),),
                      ],
                    ),
                  )
              ),
              Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircularProgressIndicator(),
                      Padding(padding: EdgeInsets.only(top: 30.0)),
                      Text("Initialization...", style: TextStyle(fontSize: 10.0, color: Colors.black26),)
                    ],
                  )
              )
            ],
          )
        ],
      ),
    );
  }
}