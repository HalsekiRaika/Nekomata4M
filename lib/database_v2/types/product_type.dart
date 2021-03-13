enum ProductType {
  HOLOLIVE,
  NIJISANJI,
  ANIMARE
}

extension TypeToString on ProductType {
  static final _typeNames = {
    ProductType.HOLOLIVE : "Hololive",
    ProductType.NIJISANJI: "Nijisanji",
    ProductType.ANIMARE  : "AniMare"
  };

  String get getStringProperty => _typeNames[this];
}

extension StringToProductType on String {
  ProductType getTypeProperty() {
    ProductType dbType;
    TypeToString._typeNames
        .forEach((key, value) { if(this == value) {dbType = key;} });
    return dbType;
  }
}