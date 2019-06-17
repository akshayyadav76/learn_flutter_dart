import 'package:flutter/material.dart';
import '../pages/deatils.dart';
import './price_tag.dart';
import 'produts_card.dart';


class Products extends StatelessWidget {
  final List<Map<String, dynamic>> products;


  Products(this.products);

//  Widget seeprodcts(BuildContext context, int index) {
//    return
//  }

  Widget buildproductlist() {
    Widget ProdcutCard;
    if (products.length > 0) {
      ProdcutCard = ListView.builder(
        itemBuilder: (BuildContext context,int index)=> ProductsCard(products[index], index),

        itemCount: products.length,
      );
    } else {
      ProdcutCard = Center(child: Text("nothing to show"));
    }
    return ProdcutCard;
  }

  @override
  Widget build(BuildContext context) {
    return buildproductlist();
  }
}
