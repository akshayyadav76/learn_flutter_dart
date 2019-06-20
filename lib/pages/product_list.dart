import 'package:flutter/material.dart';
import './product_create.dart';

class ListProductsPage extends StatelessWidget {
  List<Map<String, dynamic>> _products = [];
  final Function _update;
  final Function delete;

  ListProductsPage(this._products, this._update, this.delete);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return Dismissible(
            onDismissed: (DismissDirection dircttion) {
              if (dircttion == DismissDirection.endToStart) {
                delete(index);
              }
            },
            background: Container(
              color: Colors.red,
            ),
            key: Key(_products[index]["title"]),
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: Image.asset(_products[index]['image']),
                  title: Text(_products[index]['title']),
                  subtitle: Text('\$${_products[index]['price']}'),
                  trailing: _buildEditbutton(context, index),
                ),
                Divider(),
              ],
            ));
      },
      itemCount: _products.length,
    );
  }


  Widget _buildEditbutton(BuildContext context, int index) {
    return IconButton(
        icon: Icon(Icons.create),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) {
            return CreateProductsPage(
              products: _products[index],
              update: _update,
              index: index,
            );
          }));
        });
  }
}
