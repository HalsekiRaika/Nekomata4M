import 'package:Nekomata/Constants.dart';
import 'package:flutter/material.dart';

class TileUpcomingCard extends StatelessWidget {
  const TileUpcomingCard({
    Key key,
    @required this.size,
    @required this.imageUrl,
    @required this.title,
    @required this.channelName,
    @required this.startTime,
    @required this.countDown,
    @required this.function
  }) : super(key: key);

  final Size size;
  final String imageUrl;
  final String title, channelName, startTime, countDown;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left:   NDefaultPadding,
        right:  NDefaultPadding / 2,
        bottom: NDefaultPadding * 2.5,
      ),
      width:  size.width * 0.4,
      //height: size.height * 0.4,
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft:  Radius.circular(10),
                topRight: Radius.circular(10)
            ),
            child: Image.network(
              //https://i.ytimg.com/vi/INFI9FahPY0/mqdefault_live.jpg
              imageUrl == null ? "assets/images/NotFound.jpg" : imageUrl,
              width: 160,
              height: 90,
            ),
          ),
          GestureDetector(
              onTap: function,
              child: Container(
                width: 160,
                height: 90,
                padding: EdgeInsets.all(NDefaultPadding / 0.9),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft:  Radius.circular(10),
                        bottomRight: Radius.circular(10)
                    ),
                    color: NBoxColor,
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          offset: Offset(0, 15),
                          blurRadius: 20,
                          color: NPrimalColor.withOpacity(0.22)
                      )
                    ]
                ),
                child: Row(
                  children: <Widget>[
                    RichText(
                        text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: "$startTime\n",
                                  style: Theme.of(context).textTheme.button
                              ),
                              TextSpan(
                                  text: "$countDown\n",
                                  style: Theme.of(context).textTheme.button
                              ),
                            ]
                        )
                    ),
                  ],
                ),
              )
          )
        ],
      ),
    );
  }
}