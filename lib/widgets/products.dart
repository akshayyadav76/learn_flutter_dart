import 'package:flutter/material.dart';
import 'package:learn_flutter_dart/pages/scoped%20model/scoped_model.dart';
import 'package:scoped_model/scoped_model.dart';
import '../pages/deatils.dart';
import './price_tag.dart';
import 'produts_card.dart';

import 'package:learn_flutter_dart/module/products_map.dart';


class Products extends StatelessWidget {
//  final List<ProductsMap> products;
//  Products(this.products);

//  Widget seeprodcts(BuildContext context, int index) {
//    return
//  }

  Widget buildproductlist(List<ProductsMap>products) {
    Widget ProdcutCard;
    if (products.length > 0) {
      ProdcutCard = ListView.builder(
        itemBuilder: (BuildContext context, int index) =>
            ProductsCard(products[index], index),
        itemCount: products.length,
      );
    } else {
      ProdcutCard = Center(child: Text("nothing to show"));
    }
    return ProdcutCard;
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ProductModel>(
        builder: (BuildContext context, Widget child, ProductModel model) {
          return buildproductlist(model.dispalyedproduct);
        });

  }
}
