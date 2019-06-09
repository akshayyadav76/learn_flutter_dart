import 'package:flutter/material.dart';

class MangageProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              AppBar(
                title: Text("choose"),
                iconTheme: IconThemeData(color: Colors.white),

              ),
              ListTile(
                title: Text(
                  "manage products",
                  style: TextStyle(fontSize: 17),
                ),
                onTap: () {},
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
        body: ProductsManger());
  }
}
