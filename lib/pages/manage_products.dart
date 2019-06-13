import 'package:flutter/material.dart';
import './home_page.dart';

import './product_create.dart';
import './product_list.dart';

class MangageProducts extends StatelessWidget {
  final Function addproduct;
  final Function deleteproduct;

  MangageProducts(this.addproduct,this.deleteproduct);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            drawer: Drawer(
              child: Column(
                children: <Widget>[
                  AppBar(
                    title: Text("choose"),
                    iconTheme: IconThemeData(color: Colors.white),
                    automaticallyImplyLeading: false,
                  ),
                  ListTile(
                    title: Text(
                      "All products",
                      style: TextStyle(fontSize: 17),
                    ),
                    onTap: () {
                      Navigator.pushReplacementNamed(context, "second");
                    },
                  )
                ],
              ),
            ),
            appBar: AppBar(
              title: Text(
                "Mange products",
                style: TextStyle(color: Colors.white),
              ),
              bottom: TabBar(
                tabs: <Widget>[
                  Tab(
                      child: Text(
                        'Create products',
                        style: TextStyle(color: Colors.white,fontSize: 17),
                      ),
                      icon: Icon(Icons.create,color: Colors.white,)),
                  Tab(
                      child: Text(
                        'My products',
                        style: TextStyle(color: Colors.white,fontSize: 17),
                      ),
                      icon: Icon(Icons.list,color: Colors.white,)),
                ],
              ),
              iconTheme: IconThemeData(color: Colors.white),
            ),
            body: TabBarView(
              children: <Widget>[
                CreateProductsPage(addproduct),
                ListProductsPage(),
              ],
            )));
  }
}
