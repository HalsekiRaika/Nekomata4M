enum NotifyType {
  NO_NOTIFY,
  TEN_MINUTES_AGO,
  THIRTY_MINUTES_AGO,
  ONE_HOUR_AGO,
  TO_ORDER_AGO,
}

extension TypeToString on NotifyType {
  static const _notifyTypeEnumMap = {
    NotifyType.NO_NOTIFY: 'NO_NOTIFY',
    NotifyType.TEN_MINUTES_AGO: 'TEN_MINUTES_AGO',
    NotifyType.THIRTY_MINUTES_AGO: 'THIRTY_MINUTES_AGO',
    NotifyType.ONE_HOUR_AGO: 'ONE_HOUR_AGO',
    NotifyType.TO_ORDER_AGO: 'TO_ORDER_AGO',
  };

  String get getStringProperty => _notifyTypeEnumMap[this];
}

extension StringToNotifyType on String {
  NotifyType getTypeProperty() {
    NotifyType dbType;
    TypeToString._notifyTypeEnumMap
        .forEach((key, value) { if(this == value) {dbType = key;} });
    return dbType;
  }
}

