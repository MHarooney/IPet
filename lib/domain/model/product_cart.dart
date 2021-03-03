import 'package:ipet/domain/model/product.dart';

class ProductCart {
  ProductCart({this.product, this.quantity = 1});
  final Product product;
  int quantity;
}
