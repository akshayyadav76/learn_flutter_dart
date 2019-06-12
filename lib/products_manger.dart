import 'package:flutter/material.dart';
import 'package:learn_flutter_dart/products.dart';


class ProductsManger extends StatelessWidget {
  final List<Map<String,String>> products;


  ProductsManger(this.products);
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
       Expanded(child:  Products(products)),
    ],
    );
  }
}
