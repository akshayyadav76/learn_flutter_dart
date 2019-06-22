import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import './pages/login.dart';

import "./pages/home_page.dart";
import './pages/manage_products.dart';
import './pages/deatils.dart';
import 'module/products_map.dart';
import "./pages/scoped model/scoped_model.dart";








main() {
  runApp(Myapp());
}

class Myapp extends StatefulWidget {
  @override
  _MyappState createState() => _MyappState();
}

class _MyappState extends State<Myapp> {


  @override
  Widget build(BuildContext context) {
    return ScopedModel<ProductModel>(
        model: ProductModel(),
        child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.brown,
          accentColor: Colors.deepPurple,
          buttonColor: Colors.red,
        ),
        home: Login(),
        routes: {
          'second': (BuildContext context) => HomePage(),
          "admin": (BuildContext context) =>
              MangageProducts()
        },
        onGenerateRoute: (RouteSettings setting) {
          final List<String> pathnames = setting.name.split("/");
          if (pathnames[0] != '') {
            return null;
          }
          if (pathnames[1] == "products") {
            final int index = int.parse(pathnames[2]);
            return MaterialPageRoute<bool>(builder: (context) {
              return Deatils(null,null,null,null);
            });
          }
          return null;
        },
        onUnknownRoute: (RouteSettings setting) {
          return MaterialPageRoute(
              builder: (BuildContext context) => HomePage());
        }));
  }
}
