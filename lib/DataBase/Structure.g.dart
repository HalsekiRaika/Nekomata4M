// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Structure.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CacheStructure _$CacheStructureFromJson(Map<String, dynamic> json) {
  return CacheStructure(
    databaseId: json['databaseId'] as int,
    count: json['count'] as int,
    canNotification: json['canNotification'] as bool,
    type: _$enumDecodeNullable(_$AccessTypeEnumMap, json['type']),
    upcomingStructure: json['upcomingStructure'] as String,
  );
}

Map<String, dynamic> _$CacheStructureToJson(CacheStructure instance) =>
    <String, dynamic>{
      'databaseId': instance.databaseId,
      'count': instance.count,
      'canNotification': instance.canNotification,
      'type': _$AccessTypeEnumMap[instance.type],
      'upcomingStructure': instance.upcomingStructure,
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$AccessTypeEnumMap = {
  AccessType.HOLOLIVE: 'HOLOLIVE',
  AccessType.NIJISANJI: 'NIJISANJI',
  AccessType.ANIMARE: 'ANIMARE',
};

Collection _$CollectionFromJson(Map<String, dynamic> json) {
  return Collection(
    collect: (json['collect'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$CollectionToJson(Collection instance) =>
    <String, dynamic>{
      'collect': instance.collect,
    };

DataBaseStructure _$DataBaseStructureFromJson(Map<String, dynamic> json) {
  return DataBaseStructure(
    id: json['id'] as String,
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

Map<String, dynamic> _$DataBaseStructureToJson(DataBaseStructure instance) =>
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
