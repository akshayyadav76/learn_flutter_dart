import 'package:flutter/material.dart';
import 'package:learn_flutter_dart/products.dart';

class ProductsManger extends StatefulWidget {
  final String startproduct;
  ProductsManger(this.startproduct);

  @override
  _ProductsMangerState createState() => _ProductsMangerState();
}

class _ProductsMangerState extends State<ProductsManger> {
  List<String> _products = ["food test"];

  @override
  void initState() {
    _products.add(widget.startproduct);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Column(

      children: [Container(
      margin: EdgeInsets.all(10.0),
      child: RaisedButton(
        color: Theme.of(context).primaryColor,
        child: Text("click"),
        onPressed: (){
          setState(() {
            _products.add("banana");
          });
        },
      ),
    ),
    Products(_products),
    ],

    );
  }
}
