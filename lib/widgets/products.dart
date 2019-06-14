import 'package:flutter/material.dart';
import '../pages/deatils.dart';
import './price_tag.dart';


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

            Price_tag(products[index]['price'].toString()),

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
              IconButton(
                icon: Icon(Icons.assignment_late),
                  onPressed: () {
                    Navigator.pushNamed<bool>(context,'/products/'+index.toString());

                  }
                  ),
              IconButton(
                  icon: Icon(Icons.favorite_border),
                  color: Colors.red,
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
