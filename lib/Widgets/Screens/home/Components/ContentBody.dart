import 'package:Nekomata/DataBase/Controller/LiveDataController.dart';
import 'package:Nekomata/Widgets/Screens/details/ViewDetailsScreen/ViewDetailsScreen.dart';
import 'package:Nekomata/Widgets/Screens/home/Components/ListCardBuilder.dart';
import 'package:Nekomata/Widgets/Screens/home/Components/Stream/StreamDisplayCard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Components
import 'HeaderSearchBox.dart';
import 'TitleWithViewButtonComp.dart';

class ContentBody extends StatelessWidget {
  final LiveDataController controller = new LiveDataController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  SingleChildScrollView(
        child: Column(
          children: <Widget>[
            HeaderSearchBox(size: size),
            TitleWithViewButton(text: "Airing Soon",
                function: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ViewDetailsScreen(),)
                  );
                }),

            ListCardBuilder(size: size, )
            /*
            Provider<LiveDataController>.value(
              value: controller,
              updateShouldNotify: (before, after) => before != after,
              child: StreamDisplayCard(),
            ),

             */
            //ListCardBuilder(size: size, structure: DataBuffer.structureList),
          ],
        )
    );
  }
}

