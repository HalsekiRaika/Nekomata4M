import 'package:Nekomata/Constants.dart';
import 'package:Nekomata/Widgets/Action/FuncAggregate.dart';
import 'package:Nekomata/Widgets/Screens/License/License.dart';
import 'package:Nekomata/Widgets/Screens/details/LiveDetailsScreen/Components/TileIconCard.dart';
import 'package:Nekomata/Widgets/Screens/home/Components/ContentBody.dart';
import 'package:Nekomata/Widgets/Screens/home/Components/TitleWithViewButtonComp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset(
              "assets/icons/menubutton.svg",
              width: 14,
              height: 14
          ),
          onPressed: () { _key.currentState.openDrawer(); }
        ),
      ),
      body: ContentBody(),
      floatingActionButton: FuncAggregate(),
      drawer: SizedBox(
        width: 260,
        child: Drawer(
          child: Stack(
            children: <Widget>[
              Container(
                height: 180,
                decoration: BoxDecoration(
                  color: NPrimalColor,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20)
                  )
                ),
              ),
              Positioned(
                top: 40,
                left: 14,
                child: Column(
                  children: <Widget>[
                    Text(
                      "Nekomata",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic
                      ),
                    ),
                  ],  
                )
              ),
              Positioned(
                top: 80,
                left: 14,
                child: Row(
                  children: <Widget>[
                    TileIconCard(icons: Icons.info_outline, function: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => License(),));
                    })
                  ],
                ),
              ),
              // Group Selector
              Positioned(top: 188, left: 14, child: CustomTitle(text: " - Groups - "),),
              Positioned(
                top: 220,
                left: 14,
                child: Column(
                  children: <Widget>[
                    SideBarSelectTile("Hololive" , "assets/logo/Hololive_Logo.png", (){}),
                    SideBarSelectTile("Nijisanji", "assets/logo/Nijisanji_Logo.png", (){}),
                  ],
                )
              )
            ],
          ),
        )
      )
    );
  }
}

class SideBarSelectTile extends StatelessWidget {
  const SideBarSelectTile(this.text, this.assets, this.function, {Key key,}) : super(key: key);

  final String text;
  final String assets;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Container(
        height: 45,
        width: 230,
        padding: EdgeInsets.all(0.9),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(text, style: TextStyle(fontSize: 18,),),
            Image.asset(assets, height: 25, width: 96,)
          ]
        ),
      ),
    );
  }
}