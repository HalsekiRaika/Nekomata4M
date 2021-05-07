import 'package:nekomata/database/types/product_type.dart';

class Grouped<T> {
  final ProductType groupedTag;
  final T object;

  const Grouped(this.groupedTag, this.object);

  static Grouped<T> of<T>(ProductType tag, T object) {
    return new Grouped<T>(tag, object);
  }
}