import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ipet/domain/model/product.dart';
import 'package:ipet/domain/model/rappi_data.dart';
import 'package:ipet/domain/repository/api_repository.dart';
import 'package:ipet/presentation/common/delivery_button.dart';
import 'package:ipet/presentation/common/theme.dart';
import 'package:ipet/presentation/provider/home/cart/cart_bloc.dart';
import 'package:ipet/presentation/provider/home/products/products_bloc.dart';
import 'package:ipet/utils/hide_btn_nav_bar.dart';
import 'package:provider/provider.dart';

class ProductsScreen extends StatelessWidget {
  ProductsScreen._();

  static Widget init(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProductsBLoC(
        apiRepositoryInterface: context.read<ApiRepositoryInterface>(),
      )..loadProducts(),
      builder: (_, __) => ProductsScreen._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final productsBloc = context.watch<ProductsBLoC>();
    final cartBloc = context.watch<CartBLoC>();
    final HideBottomNavbar hideNavbar = HideBottomNavbar();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Products',
        ),
      ),
      body: productsBloc.productList.isNotEmpty
          ? GridView.builder(
              controller: hideNavbar.controller,
              padding: const EdgeInsets.all(20),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: productsBloc.productList.length,
              itemBuilder: (context, index) {
                final product = productsBloc.productList[index];
                return _ItemProduct(
                    product: product,
                    onTap: () {
                      cartBloc.add(product);
                    });
              },
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}

class _ItemProduct extends StatelessWidget {
  _ItemProduct({
    Key key,
    this.product,
    this.onTap,
    this.rappi,
  }) : super(key: key);
  final Product product;
  final RappiProduct rappi;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: Theme.of(context).canvasColor,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: LayoutBuilder(builder: (context, constraints) {
          final radius =
              min(constraints.maxHeight * 0.3, constraints.maxWidth * 0.4);
          return Column(
            children: [
              CircleAvatar(
                radius: radius,
                backgroundColor: Colors.black,
                child: ClipOval(
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    child: Image.asset(
                      product.image,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(product.name),
                    const SizedBox(height: 10),
                    Text(
                      product.description,
                      style: Theme.of(context).textTheme.overline.copyWith(
                            color: DeliveryColors.lightGrey,
                          ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '\$${product.price} USD',
                      style: TextStyle(
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                  ],
                ),
              ),
              DeliveryButton(
                width: constraints.maxWidth * 0.9,
                height: constraints.maxHeight * 0.1,
                padding: const EdgeInsets.symmetric(vertical: 4),
                text: 'Add',
                onTap: onTap,
              ),
            ],
          );
        }),
      ),
    );
  }
}
