import 'package:flutter/material.dart';
import './pages/login.dart';

import "./pages/home_page.dart";
import './pages/manage_products.dart';

main() {
  runApp(Myapp());
}

class Myapp extends StatefulWidget {
  @override
  _MyappState createState() => _MyappState();
}



class _MyappState extends State<Myapp> {


  void _addproduct(Map<String,String>startproduct){
    setState(() {
      products.add(startproduct);
    });
  }

  void _deleteprodcut(int index){
    products.removeAt(index);
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
        '/': (BuildContext context) => HomePage(),
        "admin": (BuildContext context) => MangageProducts()
      },

      onGenerateRoute: (RouteSettings setting) {
        final List<String> pathnames = setting.name.split("/");
        if (pathnames[0] != '') {
          return null;
        }
        if (pathnames[1] == "products") {
          final int index = int.parse(pathnames[2]);
          return MaterialPageRoute(builder: (context) {
            return Deatils(products[index]['title'], products[index]['image']);
          });
        }
        return null;
      },
    );
  }
}
