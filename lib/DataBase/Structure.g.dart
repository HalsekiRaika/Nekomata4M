part of 'Structure.dart';

DataBaseStructure _$StructureFromJson(Map<String, dynamic> json) {
  return DataBaseStructure(
    id:            json['_id']           as String,
    title:         json['Title']         as String,
    description:   json['Description']   as String,
    channelId:     json['ChannelId']     as String,
    channelName:   json['ChannelName']   as String,
    publish:       json['Publish']       as String,
    startTime:     json['StartTime']     as String,
    thumbnailData: json['Thumbnail']     as ThumbnailData
  );
}

ThumbnailData _$ThumbnailDataFromJson(Map<String, dynamic> json) {
  return ThumbnailData(
    url:    json['url']    as String,
    height: json['height'] as num,
    width:  json['width']  as num,
  );
}