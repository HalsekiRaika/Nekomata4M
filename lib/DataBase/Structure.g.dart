// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Structure.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CacheStructure _$CacheStructureFromJson(Map<String, dynamic> json) {
  return CacheStructure(
      databaseId       : json['database_id']        as int,
      count            : json['notify_count']       as int,
      canNotification  : json['can_notification']   == 1 ? true : false,
      type             : json['db_type'].toString().getTypeProperty(),
      upcomingStructure: json['upcoming_structure'] as String);
}

Map<String, dynamic> _$CacheStructureToJson(CacheStructure instance) =>
    <String, dynamic>{
      'database_id'       : instance.databaseId,
      'notify_count'      : instance.count,
      'can_notification'  : instance.canNotification ? 1 : 0,
      'db_type'           : instance.type.getStringProperty,
      'upcoming_structure': instance.upcomingStructure
    };

Collection _$CollectionFromJson(Map<String, dynamic> json) {
  return Collection(
    collect : json[''] as List<String>,
  );
}

DataBaseStructure _$DataBaseStructureFromJson(Map<String, dynamic> json) {
  return DataBaseStructure(
      id           : json['_id']         as String,
      title        : json['title']       as String,
      description  : json['description'] as String,
      videoId      : json['videoId']     as String,
      channelId    : json['channelId']   as String,
      channelName  : json['channelName'] as String,
      publish      : json['publish']     as String,
      startTime    : json['startTime']   as String,
      thumbnailData: json['thumbnail'] == null
          ? null
          : ThumbnailData.fromJson(
              json['thumbnail'] as Map<String, dynamic>));
}

Map<String, dynamic> _$DataBaseStructureToJson(DataBaseStructure instance) =>
    <String, dynamic>{
      'id'           : instance.id,
      'title'        : instance.title,
      'description'  : instance.description,
      'channelId'    : instance.channelId,
      'channelName'  : instance.channelName,
      'publish'      : instance.publish,
      'startTime'    : instance.startTime,
      'thumbnailData': instance.thumbnailData
    };

ThumbnailData _$ThumbnailDataFromJson(Map<String, dynamic> json) {
  return ThumbnailData(
      url   : json['url']    as String,
      width : json['width']  as String,
      height: json['height'] as String);
}

Map<String, dynamic> _$ThumbnailDataToJson(ThumbnailData instance) =>
    <String, dynamic>{
      'url'   : instance.url,
      'width' : instance.width,
      'height': instance.height
    };
