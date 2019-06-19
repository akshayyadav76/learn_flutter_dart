import 'package:flutter/material.dart';
import './product_create.dart';

class ListProductsPage extends StatelessWidget {
  List<Map<String, dynamic>> _products = [];
final Function _update;
  ListProductsPage(this._products,this._update);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          leading: Image.asset(_products[index]['image']),
          title: Text(_products[index]['title']),
          trailing: IconButton(icon: Icon(Icons.create), onPressed:(){
            Navigator.of(context).push(MaterialPageRoute(builder: (context){
              return CreateProductsPage(products:_products[index],update: _update,index: index,);
            }));
          }),
        );

      },
      itemCount: _products.length,
    );

  }
}
