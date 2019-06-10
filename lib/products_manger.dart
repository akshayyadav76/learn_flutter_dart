import 'package:flutter/material.dart';
import 'package:learn_flutter_dart/products.dart';
import 'package:learn_flutter_dart/product_control.dart';

class ProductsManger extends StatelessWidget {
  final List<Map<String,String>> products;
  final Function addproduct;
  final Function deleteproduct;
  ProductsManger(this.products,this.addproduct,this.deleteproduct);


  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Container(
      margin: EdgeInsets.all(10.0),
      child: ProductControl(addproduct),
    ),
       Expanded(child:  Products(products,delete: deleteproduct,)),
    ],

    );
  }
}
