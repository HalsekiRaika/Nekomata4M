import 'package:Nekomata/Widgets/Action/FuncAggregate.dart';
import 'package:Nekomata/Widgets/Screens/SideBar/SideBar.dart';
import 'package:Nekomata/Widgets/Screens/home/Components/ContentBody.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset("assets/icons/menubutton.svg", width: 14, height: 14),
          onPressed: () { _key.currentState.openDrawer(); }
        ),
      ),
      body: ContentBody(),
      floatingActionButton: FuncAggregate(),
      drawer: SideBar()
    );
  }
}