import 'package:flutter/material.dart';
import 'price_tag.dart';
import './ui_elements/title_default.dart';
import '../module/products_map.dart';

import 'package:scoped_model/scoped_model.dart';
import '../pages/scoped model/scoped_model.dart';

class ProductsCard extends StatelessWidget {
  final ProductsMap product;
  final int productindex;

  ProductsCard(this.product, this.productindex);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(product.image),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              // SizedBox(width: 80,),
              TitleDefulat(product.title),
              //SizedBox(width: 40,),

              Price_tag(product.price.toString()),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            decoration:
                BoxDecoration(border: Border.all(color: Colors.deepPurple)),
            child: Text(
              product.dec,
              style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20),
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                  icon: Icon(Icons.assignment_late),
                  onPressed: () {
                    Navigator.pushNamed<bool>(
                        context, '/products/' + productindex.toString());
                  }),
              ScopedModelDescendant<ProductModel>(builder:
                  (BuildContext context, Widget child, ProductModel model) {
                return IconButton(
                    icon: Icon(model.products[productindex].isFavorite
                        ? Icons.favorite
                        : Icons.favorite_border),
                    color: Colors.red,
                    onPressed: () {
                      model.selectedIndex(productindex);
                      model.toggleProductFavoriteStatus();

                    });
              })
            ],
          )
        ],
      ),
    );
  }
}
