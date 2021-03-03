import 'package:flutter/material.dart';
import 'package:ipet/domain/model/product.dart';
import 'package:ipet/domain/repository/api_repository.dart';

class ProductsBLoC extends ChangeNotifier {
  final ApiRepositoryInterface apiRepositoryInterface;

  ProductsBLoC({this.apiRepositoryInterface});

  List<Product> productList = <Product>[];

  void loadProducts() async {
    final result = await apiRepositoryInterface.getProducts();
    productList = result;
    notifyListeners();
  }
}
