import 'package:flutter/material.dart';
import 'package:nekomata/database/model/models.dart';
import 'package:nekomata/database/provider/provider.dart';
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