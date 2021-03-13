import 'package:Nekomata/database_v2/types/product_type.dart';

class Grouped<T> {
  final ProductType groupedTag;
  final T object;

  const Grouped(this.groupedTag, this.object);
}