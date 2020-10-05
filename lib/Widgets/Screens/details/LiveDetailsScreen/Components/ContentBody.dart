import 'package:Nekomata/Constants.dart';
import 'package:flutter/material.dart';

class ContentBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: NDefaultPadding * 1),
                  child: Column(
                    children: <Widget>[
                      TileIconCard(size: size, icons: Icons.add_alert_outlined, function: (){})
                    ],
                  ),
                )
            ),

            ClipRRect(
              borderRadius: BorderRadius.only(
                  // topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10)
              ),
              child: Image.network(
                "https://i.ytimg.com/vi/AxONJrZM4QQ/mqdefault_live.jpg",
                width: 288,
                height: 162,
              ),
            ),
          ],
        )
      ],
    );
  }
}

class TileIconCard extends StatelessWidget {
  const TileIconCard({
    Key key,
    @required this.size,
    @required this.icons,
    @required this.function
  }) : super(key: key);

  final Size size;
  final IconData icons;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        height: 62,
        width:  62,
        margin: EdgeInsets.symmetric(vertical: size.height * 0.03),
        padding: EdgeInsets.all(NDefaultPadding / 2),
        decoration: BoxDecoration(
            color: NBoxColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: <BoxShadow>[
              BoxShadow(
                offset: Offset(0, 10),
                blurRadius: 22,
                color: NPrimalColor.withOpacity(0.22),
              )
            ]
        ),
        child: Icon(icons, size: 30.0,),
      ),
    );
  }
}