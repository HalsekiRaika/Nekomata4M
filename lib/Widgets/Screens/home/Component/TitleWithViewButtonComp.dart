import 'package:Nekomata/Constants.dart';
import 'package:flutter/material.dart';

class TitleWithViewButton extends StatelessWidget {
  const TitleWithViewButton({
    Key key,
    @required this.text,
    @required this.function,
  }) : super(key: key);

  final String text;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: NDefaultPadding),
        child: Row(
          children: <Widget>[
            CustomTitle(text: text),
            Spacer(),
            FlatButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              color: NPrimalColor,
              child: Text(
                "View",
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 16
                ),
              ),
              onPressed: function,
            )
          ],
        )
    );
  }
}

class CustomTitle extends StatelessWidget {
  const CustomTitle({
    Key key,
    @required this.text
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: NDefaultPadding / 4),
            child: Text(
              text,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic
              ),
            ),
          ),
          Positioned(
              bottom: 0,
              left:   0,
              right:  0,
              child: Container(
                margin: EdgeInsets.only(right: NDefaultPadding / 4),
                height: 7,
                color: NPrimalColor.withOpacity(0.33),
              )
          )
        ],
      ),
    );
  }
}