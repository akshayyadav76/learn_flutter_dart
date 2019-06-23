import 'package:flutter/material.dart';
import 'dart:async';
import 'package:scoped_model/scoped_model.dart';
import './scoped model/scoped_model.dart';
import '../module/products_map.dart';

class Deatils extends StatelessWidget {
  final int index;

  Deatils(this.index);

  _Showdilog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("are you sure?"),
            content: Text("this won't undo"),
            actions: <Widget>[
              RaisedButton(
                  child: Text("dicard"),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              RaisedButton(
                  child: Text("continue"),
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context, true);
                  })
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(onWillPop: () {
      print("pack");
      Navigator.pop(context, false);
      return Future.value(false);
    }, child: ScopedModelDescendant<ProductModel>(
        builder: (BuildContext context, Widget child, ProductModel model) {
          final ProductsMap product=model.products[index];
          final double price2=product.price;
      return Scaffold(
          appBar: AppBar(title: Text(product.title)),
          body: Center(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(product.image),
              SizedBox(
                height: 10.0,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  // SizedBox(width: 80,),
                  Text(product.title),
                  //SizedBox(width: 40,),
                  Text("\$"+price2.toString())
                ],
              ),
              Text(product.dec),

              //SizedBox(height: 10.0,),

              RaisedButton(
                child: Text("delete"),
                onPressed: () {
                  _Showdilog(context);
                },
              )
            ],
          )));
    }));
  }
}
