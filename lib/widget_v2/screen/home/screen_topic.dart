import 'package:nekomata/database/database.dart';
import 'package:nekomata/widget_v2/screen/components/cards/large_live_view_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenTopic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final liveModel = Provider.of<ModelScheduledLive>(context, listen: true);
    final requestModel = Provider.of<ModelRequestType>(context, listen: true);
    return Scaffold(
      body: Container(
        child: ListView.separated(
          separatorBuilder: (BuildContext context, int index) {
            return Divider(height: 6.0, thickness: 0.01,);
          },
          itemBuilder: (context, index) {
            return LargeLiveViewCard(
                liveModel.getScheduledLive(requestModel.getRequestType())[index]
            );
          },
          itemCount: liveModel.getScheduledLive(requestModel.getRequestType()).length,
        ),
      ),
    );
  }
}