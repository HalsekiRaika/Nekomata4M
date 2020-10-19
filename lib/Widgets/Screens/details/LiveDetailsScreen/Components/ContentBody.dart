import 'package:Nekomata/Constants.dart';
import 'package:Nekomata/Widgets/Screens/home/Components/TitleWithViewButtonComp.dart';
import 'package:flutter/material.dart';

class ContentBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Container(
              height: size.height * 0.32 - 8,
              decoration: BoxDecoration(
                color: NPrimalColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                ),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: NPrimalColor.withOpacity(0.23),
                    blurRadius: 30,
                    offset: Offset(0, 10)
                  )
                ]
              ),
            ),
            Positioned(
              top: 34.2,
              right: -20,
              child: Container(
                margin:  EdgeInsets.symmetric(horizontal: NDefaultPadding),
                width: 288,
                height: 192,
                alignment: Alignment.centerRight,
                decoration: BoxDecoration(
                    color: NSecondColor,
                    borderRadius: BorderRadius.only(
                      topLeft:    Radius.circular(10),
                      bottomLeft: Radius.circular(30),
                    )
                ),
              ),
            ),
            Positioned(
              top: 204,
              right: 20,
              child: Text(
                "thumbnail".toUpperCase(),
                style: TextStyle(
                  color: NTextColor,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic
                )
              )
            ),
            Positioned(
              top: 24,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft:    Radius.circular(10),
                      bottomLeft: Radius.circular(10)
                  ),
                  child: Image.network(
                    "https://i.ytimg.com/vi/AxONJrZM4QQ/maxresdefault_live.jpg",
                    width: 320,
                    height: 180,
                  ),
                )
            ),
            /*
            Container(
                margin: EdgeInsets.symmetric(vertical: size.height * 0.028),
                child: Column(
                  children: <Widget>[
                    Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: NDefaultPadding * 1),
                          child: Row(
                            children: <Widget>[
                              TileIconCard(icons: Icons.add_alert_outlined, function: () {}),
                              TileIconCard(icons: Icons.article_outlined, function: () {})
                            ],
                          ),
                        )
                    ),
                ],
              )
            ),*/
          ],
        ),
        TitleWithLineLeftSide(height: 40, text: "  LiveTitle",),
        Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: NDefaultPadding * 1),
            child: Text(
              "【Night of the Dead】新作のゾンビゲームで罠作り生活【#1】",
              style: TextStyle(
                fontSize: 16,
                // TODO フォントの設定（なるべく見やすくおしゃれなもの）
              ),
            ),
          ),
        ),
        TitleWithLineLeftSide(height: 40, text: " Description",),
        Container(
          margin: EdgeInsets.symmetric(vertical: size.height * 0.01),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: NDefaultPadding * 1),
            child: Text(
              "8月末に出たばかりの新作のゾンビゲーム、Night of the Deadをマルチプレイしてゆく...",
              style: TextStyle(
                fontSize: 16,
                // TODO フォントの設定（なるべく見やすくおしゃれなもの（二度目））
              ),
            ),
          ),
        ),
      ]
    );
  }
}
