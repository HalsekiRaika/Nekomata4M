import 'package:Nekomata/Constants.dart';
import 'package:flutter/material.dart';

// Components
import 'HeaderSearchBox.dart';

class ContentBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          HeaderSearchBox(size: size)

        ],
      )
    );
  }
}