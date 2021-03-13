import 'package:Nekomata/database_v2/model/model_request_type.dart';
import 'package:Nekomata/widget_v2/custom/selectable.dart';
import 'package:Nekomata/widget_v2/screen/components/constant/default_values.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SideBarAccessSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final requestModel = Provider.of<ModelRequestType>(context, listen: true);
    return SizedBox(
      width: 250,
      child: Drawer(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 200,
              child: Row(
                children: <Widget>[
                  Container(
                    height: 200,
                    width: 230,
                    decoration: BoxDecoration(
                    color: Colors.greenAccent,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(20)
                    )
                  )
                  )
                ],
              ),
            ),
            Divider(),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: NDefaultPadding / 4),
                      child: Text(
                        "Products",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left:   0,
                      right:  0,
                      child: Container(
                        margin: EdgeInsets.only(right: NDefaultPadding / 4),
                        height: 7,
                        color: NPrimalColor.withOpacity(0.33),
                      )
                    )
                  ],
                ),
                SizedBox(width: 30),
                TextButton(
                  onPressed: (){},
                  child: Container(
                    height: 30,
                    width: 60,
                    decoration: BoxDecoration(
                      color: Colors.greenAccent,
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(20),
                        right: Radius.circular(20)
                      )
                    ),
                    child: Center(child: Text("View")),
                  )
                ),
              ],
            ),
            SizedBox(height: 20),
            SelectableListTile(
              items: const [
                SelectableTileItem(icon: Icons.people_rounded, title: "Hololive"),
                SelectableTileItem(icon: Icons.people_rounded, title: "Nijisanji"),
                SelectableTileItem(icon: Icons.people_rounded, title: "Animare")
              ],
              currentIndex: requestModel.getIndex,
              onSelect: (int index) => requestModel.changeType(index),
            )
          ],
        ),
      ),
    );
  }
}