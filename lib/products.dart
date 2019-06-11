import 'package:flutter/material.dart';
import './pages/deatils.dart';


class Products extends StatelessWidget {
  final List<Map<String, String>> products;
  final Function delete;

  Products(this.products,{this.delete});

  Widget seeprodcts(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(products[index]['image']),
          Text(products[index]['title']),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                  child: Text("deatils"),
                  onPressed: () {
                    Navigator.pushNamed<bool>(context,'/products/'+index.toString())
                        .then((bool value){
                    if(value){
                      delete(index);
                    }
                    if(index == 0){Navigator.pushReplacementNamed(context, "admins");}

                    });

                  }


                  )
            ],
          )
        ],
      ),
    );
  }

  Widget buildproductlist() {
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
    return buildproductlist();
  }
}
