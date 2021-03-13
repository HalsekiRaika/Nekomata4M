import 'package:nekomata/database/database.dart';
import 'package:nekomata/widget_v2/screen/components/reload_button.dart';
import 'package:nekomata/widget_v2/screen/sidebar/sidebar_access_selector.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenWithNavigate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenModel  = Provider.of<ModelScreenState>(context, listen: true);
    final liveModel    = Provider.of<ModelScheduledLive>(context, listen: true);
    final requestModel = Provider.of<ModelRequestType>(context, listen: true);
    return Scaffold(
      appBar: AppBar(leading: IconButton(icon: Icon(Icons.menu_open, size: 30,), onPressed: (){
        liveModel.getScheduledLive(requestModel.getRequestType()).forEach((element) {
          print(ExtractLiveTitle.onExtract(element));
          print(ExtractThumbnailUrl.onExtract(element));
        });
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