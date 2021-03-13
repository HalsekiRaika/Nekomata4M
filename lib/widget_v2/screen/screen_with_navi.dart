import 'package:Nekomata/database_v2/extractor/ext_live_data.dart';
import 'package:Nekomata/database_v2/model/models.dart';
import 'package:Nekomata/widget_v2/screen/components/reload_button.dart';
import 'package:Nekomata/widget_v2/screen/sidebar/sidebar_access_selector.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenWithNavigate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenModel = Provider.of<ModelScreenState>(context, listen: true);
    final liveModel = Provider.of<ModelScheduledLive>(context, listen: true);
    return Scaffold(
      appBar: AppBar(leading: IconButton(icon: Icon(Icons.menu_open, size: 30,), onPressed: (){
        liveModel.hololiveScheduledLive.forEach((element) { print(ExtractLiveData.onExtract(element).title); });
      },)),
      body: screenModel.getScreen(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favorite"),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: "Notify")
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: screenModel.getScreenIndex,
        selectedItemColor: Colors.black38,
        onTap: (int index) => screenModel.changeScreen(index),
      ),
      drawer: SideBarAccessSelector(),
      floatingActionButton: ReloadButton(),
    );
  }
}