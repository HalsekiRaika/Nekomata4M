import 'package:Nekomata/Constants.dart';
import 'package:flutter/material.dart';

class HeaderSearchBox extends StatelessWidget {
  const HeaderSearchBox({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.1,
      child: Stack(
        children: <Widget>[
          Container(
            height: size.height * 0.1 - 30,
            decoration: BoxDecoration(
                color: NPrimalColor,
                borderRadius: BorderRadius.only(
                  bottomLeft:  Radius.circular(30),
                  bottomRight: Radius.circular(30),
                )
            ),
          ),
          Positioned(
            bottom: 12,
            left: 0,
            right: 0,
            child: Container(
              alignment: Alignment.center,
              margin:  EdgeInsets.symmetric(horizontal: NDefaultPadding),
              padding: EdgeInsets.symmetric(horizontal: NDefaultPadding),
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      offset: Offset(0, 5),
                      blurRadius: 50,
                      color: NPrimalColor.withOpacity(0.23)
                  )
                ]
              ),
              child: TextField(
                onChanged: (String value) {},
                decoration: InputDecoration(
                  hintText: "Search",
                  hintStyle: TextStyle(
                      color: NPrimalColor.withOpacity(0.6)
                  ),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  icon: Icon(Icons.search),
                ),
              ),
            )
          )
        ],
      ),
    );
  }
}