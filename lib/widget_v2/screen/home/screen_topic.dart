import 'package:Nekomata/DataBase/Model/LiveModel.dart';
import 'package:Nekomata/database_v2/extractor/ext_live_data.dart';
import 'package:Nekomata/database_v2/model/model_scheduled_live.dart';
import 'package:Nekomata/widget_v2/screen/components/cards/large_live_view_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenTopic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final liveModel = Provider.of<ModelScheduledLive>(context, listen: true);
    return Scaffold(
      body: Expanded(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return LargeLiveViewCard(
                ExtractLiveData.onExtractAsList(
                    liveModel.hololiveScheduledLive)[index]);
          },
          itemCount: liveModel.hololiveScheduledLive.length,
          shrinkWrap: true,
        ),
      ),
    );
  }
}