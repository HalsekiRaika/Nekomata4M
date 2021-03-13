import 'package:Nekomata/database_v2/types/notify_type.dart';
import 'package:Nekomata/database_v2/types/product_type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cached_object.g.dart';

@JsonSerializable()
class CachedObject {
  final String  databaseId;
  final int  notifyCount;
  final NotifyType  canNotify;
  final ProductType productType;
  final String rawUpcomingModel;

  CachedObject(
    this.productType,
    this.rawUpcomingModel,
    {
      this.databaseId,
      this.notifyCount,
      this.canNotify,
    });

  factory CachedObject.fromJson(Map<String, dynamic> json)
  => _$CachedObjectFromJson(json);

  Map<String, dynamic> toJson() => _$CachedObjectToJson(this);
}