import 'package:json_annotation/json_annotation.dart';
import 'package:mongo_dart/mongo_dart.dart';

part 'Structure.g.dart';

@JsonSerializable()
class CacheStructure {
  int count;
  bool canNotification;
  DataBaseStructure upcomingStructure;
}

@JsonSerializable()
class DataBaseStructure {
  final ObjectId id;
  final String title;
  final String description;
  final String channelId;
  final String channelName;
  final String publish;
  final String startTime;
  final ThumbnailData thumbnailData;

  DataBaseStructure({
    this.id,
    this.title,
    this.description,
    this.channelId,
    this.channelName,
    this.publish,
    this.startTime,
    this.thumbnailData
  });

  factory DataBaseStructure.fromJson(Map<String, dynamic> json)
      => _$StructureFromJson(json);
}

class ThumbnailData {
  String url;
  int width;
  int height;

  ThumbnailData({this.url, this.width, this.height});
}