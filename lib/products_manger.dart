import 'package:flutter/material.dart';
import 'package:learn_flutter_dart/widgets/products.dart';
import './module/products_map.dart';

class ProductsManger extends StatelessWidget {

//  final List<ProductsMap> products;
//  ProductsManger(this.products);

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
       Expanded(child:  Products()),
    ],
    );
  }
}
