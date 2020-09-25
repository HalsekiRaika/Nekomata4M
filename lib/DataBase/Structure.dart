import 'package:json_annotation/json_annotation.dart';

part 'Structure.g.dart';

@JsonSerializable()
class CacheStructure {
  final int count;
  final bool canNotification;
  final DataBaseStructure upcomingStructure;

  CacheStructure({
    this.count,
    this.canNotification,
    this.upcomingStructure
  });

  factory CacheStructure.fromJson(Map<String, dynamic> json)
  => _$CacheStructureFromJson(json);

  Map<String, dynamic> toJson() => _$CacheStructureToJson(this);
}

class Collection {
  final List<String> collect;

  Collection({this.collect});

  factory Collection.fromJson(Map<String, dynamic> json)
  => _$CollectionFromJson(json);
}

@JsonSerializable()
class DataBaseStructure {
  final String id;
  final String title;
  final String description;
  final String videoId;
  final String channelId;
  final String channelName;
  final String publish;
  final String startTime;
  final ThumbnailData thumbnailData;

  DataBaseStructure({
    this.id,
    this.title,
    this.description,
    this.videoId,
    this.channelId,
    this.channelName,
    this.publish,
    this.startTime,
    this.thumbnailData
  });

  factory DataBaseStructure.fromJson(Map<String, dynamic> json)
      => _$DataBaseStructureFromJson(json);
}

@JsonSerializable()
class ThumbnailData {
  String url;
  String width;
  String height;

  ThumbnailData({this.url, this.width, this.height});

  factory ThumbnailData.fromJson(Map<String, dynamic> json)
      => _$ThumbnailDataFromJson(json);
}