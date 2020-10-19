import 'package:Nekomata/Widgets/Screens/details/ViewDetailsScreen/ViewDetailsScreen.dart';
import 'package:Nekomata/Widgets/Screens/home/Components/StreamDisplayCard.dart';
import 'package:flutter/material.dart';

// Components
import 'HeaderSearchBox.dart';
import 'TitleWithViewButtonComp.dart';

class ContentBody extends StatelessWidget {
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

            StreamDisplayCard()
            //ListCardBuilder(size: size, structure: DataBuffer.structureList),
          ],
        )
    );
  }
}

