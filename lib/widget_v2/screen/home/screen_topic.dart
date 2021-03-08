import 'package:Nekomata/DataBase/Model/LiveModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenTopic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final liveModel = Provider.of<LiveModel>(context, listen: true);
    return Scaffold(
      body: Expanded(
        child: ListView.builder(
            itemBuilder: (context, index) {
              return;
            }
        ),
      ),
    );
  }
}