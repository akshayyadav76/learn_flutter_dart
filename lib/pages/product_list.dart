import 'package:flutter/material.dart';
import './product_create.dart';
import '../module/products_map.dart';

import 'package:scoped_model/scoped_model.dart';
import './scoped model/scoped_model.dart';

class ListProductsPage extends StatelessWidget {
//  List<ProductsMap> _products = [];
//  final Function _update;
//  final Function delete;
//
//  ListProductsPage(this._products, this._update, this.delete);

  @override
  Widget build(BuildContext context) {
    return  ScopedModelDescendant(builder: (BuildContext context,Widget child,ProductModel model){
      return ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
              onDismissed: (DismissDirection dircttion) {
                if (dircttion == DismissDirection.endToStart) {
                  model.selectedIndex(index);
                  model.deleteprodcut();
                }
              },
              background: Container(
                color: Colors.red,
              ),
              key: Key(model.products[index].title),
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: Image.asset(model.products[index].image),
                    title: Text(model.products[index].title),
                    subtitle: Text('\$${model.products[index].price}'),
                    trailing: _buildEditbutton(context, index,model),
                  ),
                  Divider(),
                ],
              ));
        },
        itemCount: model.products.length,
      );
    });
  }


  Widget _buildEditbutton(BuildContext context, int index, ProductModel model) {

      return  IconButton(
          icon: Icon(Icons.create),
          onPressed: () {
            model.selectedIndex(index);
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) {
              return CreateProductsPage();
            }));
          });


  }
}
