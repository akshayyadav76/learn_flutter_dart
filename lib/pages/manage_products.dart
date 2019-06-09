import 'package:flutter/material.dart';
import './home_page.dart';

class MangageProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return HomePage();
                  }));
                },
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
         body: Center(child: Text("this tha all products"),),);
  }
}
