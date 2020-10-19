import 'package:Nekomata/Constants.dart';
import 'package:Nekomata/Widgets/Screens/License/License.dart';
import 'package:Nekomata/Widgets/Screens/details/LiveDetailsScreen/Components/TileIconCard.dart';
import 'package:Nekomata/Widgets/Screens/home/Components/TitleWithViewButtonComp.dart';
import 'package:flutter/material.dart';

import 'Components/SideBarSelectTile.dart';

class SideBar extends StatelessWidget {
  const SideBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
    );
  }
}