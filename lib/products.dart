import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  final List<String>products;
  Products(this.products);

  Widget seeprodcts(BuildContext context ,int index){
    return Card(
      child: Column(
        children: <Widget>[
          Image(image: AssetImage("images/tic.jpg")),
          Text(products[index])
        ],
      ),
    );

  }

  @override
  Widget build(BuildContext context) {
    return  products.length > 0 ? ListView.builder(
      itemBuilder: seeprodcts,
      itemCount: products.length,
        ): Center(child: Text("nothing to show"),);
  }
}
