import 'package:Nekomata/Constants.dart';
import 'package:Nekomata/Widgets/Screens/details/LiveDetailsScreen/Components/ContentBody.dart';
import 'package:flutter/material.dart';

class LiveDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: NPrimalColor,
        onPressed: (){ Navigator.pop(context); },
        child: Icon(Icons.backspace_outlined),
      ),
      body: ContentBody(),
    );
  }
}