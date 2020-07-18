part of 'Structure.dart';

DataBaseStructure _$StructureFromJson(Map<String, dynamic> json) {
  return DataBaseStructure(
    id:            json['_id']           as ObjectId,
    title:         json['Title']         as String,
    description:   json['Description']   as String,
    channelId:     json['ChannelId']     as String,
    channelName:   json['ChannelName']   as String,
    publish:       json['Publish']       as String,
    startTime:     json['StartTime']     as String,
    thumbnailData: json['Thumbnail']     as ThumbnailData
  );
}