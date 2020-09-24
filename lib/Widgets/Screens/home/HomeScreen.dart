import 'package:Nekomata/Widgets/Screens/home/Component/ContentBody.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset(
              "assets/icons/menubutton.svg",
              width: 14,
              height: 14
          ),
          onPressed: () {}
        ),
      ),
      body: ContentBody(),
    );
  }
}
