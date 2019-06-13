import 'package:flutter/material.dart';
import './pages/deatils.dart';


class Products extends StatelessWidget {
  final List<Map<String, dynamic>> products;


  Products(this.products);

  Widget seeprodcts(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(products[index]['image']),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: <Widget>[
           // SizedBox(width: 80,),
            Text(products[index]['title'],style: TextStyle(fontStyle: FontStyle.italic,fontSize: 20),),
            //SizedBox(width: 40,),
            Container(
                        decoration: BoxDecoration(border: Border.all(color: Colors.deepPurple)),
              child: Text('\$${products[index]['price'].toString()}',
                style: TextStyle(fontStyle: FontStyle.italic,fontSize: 20),),
            ),
          ],),
          SizedBox(height: 10,),
          Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.deepPurple)),
            child: Text('Lalghati,Airport road,Bhopal',
              style: TextStyle(fontStyle: FontStyle.italic,fontSize: 20),),
          ),

          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                  child: Text("deatils"),
                  onPressed: () {
                    Navigator.pushNamed<bool>(context,'/products/'+index.toString());

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
