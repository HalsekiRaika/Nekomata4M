import 'package:Nekomata/DataBase/Controller/LiveDataController.dart';
import 'package:Nekomata/DataBase/Model/CollectorModel.dart';
import 'package:Nekomata/DataBase/Model/LiveModel.dart';
import 'package:Nekomata/DataBase/Types/AccessType.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReloadButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<LiveModel>(context, listen: true);
    return FloatingActionButton(
        onPressed: () => {
          LiveDataController.dataRetrieve(CollectorModel().getAccessType())}
    );
  }
}