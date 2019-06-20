import 'package:flutter/material.dart';
import './pages/login.dart';

import "./pages/home_page.dart";
import './pages/manage_products.dart';
import 'package:learn_flutter_dart/widgets/products.dart';
import './pages/deatils.dart';
import './module/products_map.dart';

main() {
  runApp(Myapp());
}

class Myapp extends StatefulWidget {
  @override
  _MyappState createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  List<ProductsMap> _products = [];

  void _addproduct(ProductsMap productsdata) {
    setState(() {
      _products.add(productsdata);
    });
  }

  void _deleteprodcut(int index) {
    _products.removeAt(index);
  }

  void _update(int index, ProductsMap product) {
    setState(() {
      _products[index] = product;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.brown,
          accentColor: Colors.deepPurple,
          buttonColor: Colors.red,
        ),
        home: Login(),
        routes: {
          'second': (BuildContext context) => HomePage(_products),
          "admin": (BuildContext context) =>
              MangageProducts(_addproduct, _deleteprodcut, _products, _update)
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
                  _products[index].title,
                  _products[index].image,
                  _products[index].dec,
                  _products[index].price);
            });
          }
          return null;
        },
        onUnknownRoute: (RouteSettings setting) {
          return MaterialPageRoute(
              builder: (BuildContext context) => HomePage(_products));
        });
  }
}
