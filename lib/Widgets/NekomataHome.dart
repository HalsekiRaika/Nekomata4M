import 'package:Nekomata/DataBase/Aggregater.dart';
import 'package:Nekomata/DataBase/Channels/ProdHololiveComponent.dart';
import 'package:Nekomata/DataBase/Structure.dart';
import 'package:Nekomata/Widgets/NekomataHeader.dart';
import 'package:flutter/material.dart';

class NekomataHome extends StatefulWidget {

  @override
  _NekomataHome createState() => _NekomataHome();
}

class _NekomataHome extends State<NekomataHome> {
  List<DataBaseStructure> _buffer = new List<DataBaseStructure>();


  void reloadCache() async {
    if (_buffer.isNotEmpty) { _buffer.clear(); }
    _buffer = await NekomataDataBase().aggregateData(DataBase.HOLOLIVE, Id.shirakamiFubuki);
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: NekomataHeader(),

      backgroundColor: Color.fromARGB(1000, 237, 223, 245),
      floatingActionButton: new FloatingActionButton(
          onPressed: reloadCache
      ),
    );
  }
}