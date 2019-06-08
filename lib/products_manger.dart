import 'package:flutter/material.dart';
import 'package:learn_flutter_dart/products.dart';
import 'package:learn_flutter_dart/product_control.dart';

class ProductsManger extends StatefulWidget {
  final Map<String,String> startproduct;
  ProductsManger({this.startproduct});

  @override
  _ProductsMangerState createState() => _ProductsMangerState();
}

class _ProductsMangerState extends State<ProductsManger> {
  List<Map<String ,String>> _products = [];

  @override
  void initState() {
    if(widget.startproduct != null){
    _products.add(widget.startproduct);}
    super.initState();
  }

  void _addproduct(Map<String,String>startproduct){
    setState(() {
      _products.add(startproduct);
    });
  }

  void _deleteprodcut(int index){
    _products.removeAt(index);
  }

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Container(
      margin: EdgeInsets.all(10.0),
      child: ProductControl(_addproduct),
    ),
       Expanded(child:  Products(_products,delete: _deleteprodcut,)),
    ],

    );
  }
}
