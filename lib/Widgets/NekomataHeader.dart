import 'package:flutter/material.dart';

class NekomataHeader extends StatelessWidget with PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: new Text("Nekomata"),
      centerTitle: true,
      backgroundColor: Color.fromARGB(1000, 194, 89, 206),
      leading: Padding(
        padding: const EdgeInsets.all(0.8),
        child: Icon(Icons.settings),
      ),
    );
  }
}