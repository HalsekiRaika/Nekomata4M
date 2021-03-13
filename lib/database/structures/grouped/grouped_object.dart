import 'package:nekomata/database/types/product_type.dart';

class Grouped<T> {
  final ProductType groupedTag;
  final T object;

  const Grouped(this.groupedTag, this.object);
}