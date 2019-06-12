import 'package:flutter/material.dart';
import './pages/login.dart';

import "./pages/home_page.dart";
import './pages/manage_products.dart';
import './products.dart';
import './pages/deatils.dart';

main() {
  runApp(Myapp());
}

class Myapp extends StatefulWidget {
  @override
  _MyappState createState() => _MyappState();
}



class _MyappState extends State<Myapp> {
  List<Map<String, String>> _products = [];

  void _addproduct(Map<String, String>products) {
    setState(() {
      _products.add(products);
    });
  }

  void _deleteprodcut(int index) {
    _products.removeAt(index);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.lightBlue,
          accentColor: Colors.white,
        ),
        // home:  Login(),
        routes: {
          '/': (BuildContext context) =>
              HomePage(_products, _addproduct, _deleteprodcut),
          "admin": (BuildContext context) => MangageProducts()
        },

        onGenerateRoute: (RouteSettings setting) {
          final List<String> pathnames = setting.name.split("/");
          if (pathnames[0] != '') {
            return null;
          }
          if (pathnames[1] == "products") {
            final int index = int.parse(pathnames[2]);
            return MaterialPageRoute<bool>(builder: (context) {
              return Deatils(
                  _products[index]['title'], _products[index]['image']);
            });
          }
          return null;
        },

        onUnknownRoute: (RouteSettings setting) {
          return MaterialPageRoute(builder: (BuildContext context) =>
              HomePage(_products, _addproduct, _deleteprodcut));
        });
  }
}