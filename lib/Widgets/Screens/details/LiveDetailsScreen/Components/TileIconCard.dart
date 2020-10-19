import 'package:Nekomata/Constants.dart';
import 'package:flutter/material.dart';

class TileIconCard extends StatelessWidget {
  const TileIconCard({
    Key key,
    @required this.icons,
    @required this.function
  }) : super(key: key);

  final IconData icons;
  final Function function;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: function,
      child: Container(
        height: 62,
        width:  62,
        margin: EdgeInsets.symmetric(vertical: size.height * 0.018),
        padding: EdgeInsets.all(NDefaultPadding / 2),
        decoration: BoxDecoration(
            color: NSecondColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: <BoxShadow>[
              BoxShadow(
                offset: Offset(0, 10),
                blurRadius: 22,
                color: Colors.black12.withOpacity(0.13),
              )
            ]
        ),
        child: Icon(icons, size: 30.0,),
      ),
    );
  }
}