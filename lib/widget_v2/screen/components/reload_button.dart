import 'package:Nekomata/DataBase/Model/CollectorModel.dart';
import 'package:Nekomata/DataBase/Model/LiveModel.dart';
import 'package:Nekomata/DataBase/Types/AccessType.dart';
import 'package:Nekomata/database_v2/model/model_request_type.dart';
import 'package:Nekomata/database_v2/provider/service/database_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReloadButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<ModelRequestType>(context, listen: true);
    return FloatingActionButton(
        onPressed: () async {
          //LiveDataController.dataRetrieve(CollectorModel().getAccessType())
          DataBaseProvider().onRequest(model.getRequestType());
        }
    );
  }
}