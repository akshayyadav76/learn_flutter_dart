import 'package:flutter/material.dart';
import 'package:learn_flutter_dart/products_manger.dart';

main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.lightBlue),
      home: Scaffold(
          appBar: AppBar(title: Text("easylit")),
          body: ProductsManger("orange")),
    );
  }
}
