import 'package:json_annotation/json_annotation.dart';

part 'upcoming_object.g.dart';

@JsonSerializable()
class UpcomingObject {
  final String id;
  final String title;
  final String description;
  final String videoId;
  final String channelId;
  final String channelName;
  final String publish;
  final String startTime;
  final ThumbnailData thumbnailData;

  UpcomingObject({
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

  factory UpcomingObject.fromJson(Map<String, dynamic> json)
  => _$UpcomingObjectFromJson(json);

  Map<String, dynamic> toJson() => _$UpcomingObjectToJson(this);
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