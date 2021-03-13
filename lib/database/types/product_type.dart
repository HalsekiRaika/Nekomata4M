enum ProductType {
  HOLOLIVE,
  NIJISANJI,
  ANIMARE
}

extension ProductTypeToString on ProductType {
  static final _typeNames = {
    ProductType.HOLOLIVE : "Hololive",
    ProductType.NIJISANJI: "Nijisanji",
    ProductType.ANIMARE  : "AniMare"
  };

  String get getStringProperty => _typeNames[this];
}

extension StringToProductType on String {
  ProductType getProductTypeProperty() {
    ProductType dbType;
    ProductTypeToString._typeNames
        .forEach((key, value) { if(this == value) {dbType = key;} });
    return dbType;
  }
}