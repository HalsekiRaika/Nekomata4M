enum AccessType {
  HOLOLIVE,
  NIJISANJI,
  ANIMARE
}

extension TypeToString on AccessType {
  static final _typeNames = {
    AccessType.HOLOLIVE : "Hololive",
    AccessType.NIJISANJI: "Nijisanji",
    AccessType.ANIMARE  : "AniMare"
  };

  String get getStringProperty => _typeNames[this];
}

extension StringToType on String {
  AccessType getTypeProperty() {
    AccessType dbType;
    TypeToString._typeNames
        .forEach((key, value) { if(this == value) {dbType = key;} });
    return dbType;
  }
}