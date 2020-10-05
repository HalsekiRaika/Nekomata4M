import 'package:Nekomata/Widgets/Screens/details/LiveDetailsScreen/Components/ContentBody.dart';
import 'package:flutter/material.dart';

class LiveDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("ライブ詳細"),
      ),
      body: ContentBody(),
    );
  }
}