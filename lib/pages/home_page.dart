import 'package:flutter/material.dart';
import 'package:learn_flutter_dart/products_manger.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          appBar: AppBar(title: Text("easylit")),
          body: ProductsManger());

  }
}
