import 'package:flutter/material.dart';
import 'package:learn_flutter_dart/products_manger.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       drawer: Drawer(child: Column(

       ),),
          appBar: AppBar(title: Text("easylit",style: TextStyle(color: Colors.white),
          ),iconTheme: IconThemeData(color: Colors.white),),
          body: ProductsManger());

  }
}
