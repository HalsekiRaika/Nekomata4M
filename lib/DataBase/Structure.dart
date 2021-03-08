import 'package:Nekomata/DataBase/Provider/DataStreamProvider.dart';
import 'package:Nekomata/DataBase/Types/AccessType.dart';
import 'package:json_annotation/json_annotation.dart';

part 'Structure.g.dart';

@JsonSerializable()
class CacheStructure {
  final int databaseId;
  final int count;
  final bool canNotification;
  final AccessType type;
  final String upcomingStructure;

  CacheStructure({
    this.databaseId,
    this.count,
    this.canNotification,
    this.type,
    this.upcomingStructure
  });

  factory CacheStructure.fromJson(Map<String, dynamic> json)
  => _$CacheStructureFromJson(json);

  Map<String, dynamic> toJson() => _$CacheStructureToJson(this);

  CacheStructure getDefaultProperty(AccessType type, String baseStructure)
    => CacheStructure(count: 0, canNotification: false, type: type, upcomingStructure: baseStructure);
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

  Map<String, dynamic> toJson() => _$DataBaseStructureToJson(this);
}

@JsonSerializable()
class ThumbnailData {
  String url;
  String width;
  String height;

  ThumbnailData({this.url, this.width, this.height});

  factory ThumbnailData.fromJson(Map<String, dynamic> json)
      => _$ThumbnailDataFromJson(json);

  Map<String, dynamic> toJson() => _$ThumbnailDataToJson(this);
}