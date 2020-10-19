import 'package:flutter/material.dart';

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