// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cached_object.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CachedObject _$CachedObjectFromJson(Map<String, dynamic> json) {
  return CachedObject(
    _$enumDecodeNullable(_$ProductTypeEnumMap, json['product_type']),
    json['raw_upcoming_model'] as String,
    databaseId: json['database_id'] as String,
    notifyCount: json['notify_count'] as int,
    canNotify: _$enumDecodeNullable(_$NotifyTypeEnumMap, json['can_notify']),
  );
}

Map<String, dynamic> _$CachedObjectToJson(CachedObject instance) =>
    <String, dynamic>{
      'database_id'       : instance.databaseId,
      'notify_count'      : instance.notifyCount,
      'can_notify'        : _$NotifyTypeEnumMap[instance.canNotify],
      'product_type'      : _$ProductTypeEnumMap[instance.productType],
      'raw_upcoming_model': instance.rawUpcomingModel,
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

const _$ProductTypeEnumMap = {
  ProductType.HOLOLIVE: 'HOLOLIVE',
  ProductType.NIJISANJI: 'NIJISANJI',
  ProductType.ANIMARE: 'ANIMARE',
};

const _$NotifyTypeEnumMap = {
  NotifyType.NO_NOTIFY: 'NO_NOTIFY',
  NotifyType.TEN_MINUTES_AGO: 'TEN_MINUTES_AGO',
  NotifyType.THIRTY_MINUTES_AGO: 'THIRTY_MINUTES_AGO',
  NotifyType.ONE_HOUR_AGO: 'ONE_HOUR_AGO',
  NotifyType.TO_ORDER_AGO: 'TO_ORDER_AGO',
};
