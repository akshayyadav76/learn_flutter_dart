import 'package:flutter/material.dart';
import 'package:learn_flutter_dart/products_manger.dart';
import './manage_products.dart';

class HomePage extends StatelessWidget {

  final List<Map<String,dynamic>> products;

  HomePage(this.products,);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              AppBar(
                title: Text("choose"),
                iconTheme: IconThemeData(color: Colors.white),
                automaticallyImplyLeading: false,
              ),
              ListTile(
                leading: Icon(Icons.create),
                title: Text(
                  "manage products",
                  style: TextStyle(fontSize: 17),
                ),
                onTap: () {
                  Navigator.pushReplacementNamed(context, "admin");
                },
              )
            ],
          ),
        ),
        appBar: AppBar(
          title: Text(
            "easylit",
            style: TextStyle(color: Colors.white),
          ),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        body: ProductsManger(products));
  }
}
