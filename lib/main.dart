import 'package:flutter/material.dart';
import './pages/login.dart';

import "./pages/home_page.dart";
import './pages/manage_products.dart';

main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
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
          '/': (BuildContext context)=>HomePage(),
          "admin":(BuildContext context)=>MangageProducts()},

    );
  }
}
