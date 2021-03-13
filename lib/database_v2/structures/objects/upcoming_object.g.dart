// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upcoming_object.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpcomingObject _$UpcomingObjectFromJson(Map<String, dynamic> json) {
  return UpcomingObject(
    id: json['_id'] as String,
    title: json['title'] as String,
    description: json['description'] as String,
    videoId: json['videoId'] as String,
    channelId: json['channelId'] as String,
    channelName: json['channelName'] as String,
    publish: json['publish'] as String,
    startTime: json['startTime'] as String,
    thumbnailData: json['thumbnailData'] == null
        ? null
        : ThumbnailData.fromJson(json['thumbnailData'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UpcomingObjectToJson(UpcomingObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'videoId': instance.videoId,
      'channelId': instance.channelId,
      'channelName': instance.channelName,
      'publish': instance.publish,
      'startTime': instance.startTime,
      'thumbnailData': instance.thumbnailData,
    };

ThumbnailData _$ThumbnailDataFromJson(Map<String, dynamic> json) {
  return ThumbnailData(
    url: json['url'] as String,
    width: json['width'] as String,
    height: json['height'] as String,
  );
}

Map<String, dynamic> _$ThumbnailDataToJson(ThumbnailData instance) =>
    <String, dynamic>{
      'url': instance.url,
      'width': instance.width,
      'height': instance.height,
    };
