import 'dart:async';
import 'dart:convert';

import 'package:Nekomata/DataBase/Model/LiveModel.dart';
import 'package:Nekomata/DataBase/Structure.dart';
import 'package:Nekomata/DataBase/Types/AccessType.dart';

class SearchController {
  static final _filterPrefix = "#";
  static List<String> _processedValue = [];
  static List<String> _filterValue    = [];
  static List<CacheStructure> _searched = [];

  // ignore: close_sinks
  static final _searchStreamController = new StreamController<String>();
  static final _validateTransformer = new StreamTransformer<String, List<CacheStructure>>.fromHandlers(
    handleData: (value, sink) => {
      _filterValue = _removeFilterOptions(value),
      _processedValue = value.replaceAll(_filterPrefix, '').split(' ').toList(),
      if(!value.contains(_filterPrefix)) {
        _searched = LiveModel().allScheduledLive
            .where((element) => _extractTitle(element).contains(value))
            .toList(),
        if(_searched.isNotEmpty) {
          sink.add(_searched)
        } else {
          sink.addError("一致するものがありませんでした。")
        }
      } else {
        if (_processedValue.contains(_regExpBuilder(AccessType.HOLOLIVE))) {
          for(String searching in _filterValue) {
            _searched = LiveModel().hololiveScheduledLive
                .where((element) => _extractTitle(element).contains(searching)),
            sink.add(_searched)
          }
        } else if (_processedValue.contains(_regExpBuilder(AccessType.NIJISANJI))) {
          for(String searching in _filterValue) {
            _searched = LiveModel().nijisanjiScheduledLive
                .where((element) => _extractTitle(element).contains(searching)),
            sink.add(_searched)
          }
        } else if (_processedValue.contains(_regExpBuilder(AccessType.ANIMARE))) {
          for(String searching in _filterValue) {
            _searched = LiveModel().animareScheduledLive
                .where((element) => _extractTitle(element).contains(searching)),
            sink.add(_searched)
          }
        }
      }
    }
  );

  static final searchUpController = _searchStreamController.stream.transform(_validateTransformer);
  static StreamSink<String> get searchUpSink => _searchStreamController.sink;

  static RegExp _regExpBuilder(AccessType accessType) {
    return new RegExp(accessType.getStringProperty, caseSensitive: false);
  }
  
  static List<String> _removeFilterOptions(String rawValue) {
    return rawValue.split(' ').toList()
        .where((element) => !element.contains('#'))
        .toList();
  }

  static String _extractTitle(CacheStructure structure) {
    return DataBaseStructure.fromJson(jsonDecode(structure.upcomingStructure)).title;
  }
}