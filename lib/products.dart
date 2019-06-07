import 'package:flutter/material.dart';
import './pages/deatils.dart';

class Products extends StatelessWidget {
  final List<String> products;

  Products(this.products);

  Widget seeprodcts(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          Image(image: AssetImage("images/tic.jpg")),
          Text(products[index]),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                  child: Text("deatils"),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Deatils();
                    }));
                  })
            ],
          )
        ],
      ),
    );
  }

  Widget _buildproductlist() {
    Widget ProdcutCard;
    if (products.length > 0) {
      ProdcutCard = ListView.builder(
        itemBuilder: seeprodcts,
        itemCount: products.length,
      );
    } else {
      ProdcutCard = Center(child: Text("nothing to show"));
    }
    return ProdcutCard;
  }

  @override
  Widget build(BuildContext context) {
    return _buildproductlist();
  }
}
