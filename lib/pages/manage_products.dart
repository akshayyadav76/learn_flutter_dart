import 'package:flutter/material.dart';
import './home_page.dart';

class MangageProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child:  Scaffold(
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
            "Mange products",
            style: TextStyle(color: Colors.white),
          ),
          bottom: TabBar(tabs: <Widget>[
            Tab(text: 'Create products',icon: Icon(Icons.create)),
            Tab(text: 'My products',icon: Icon(Icons.list)),

          ],),
          iconTheme: IconThemeData(color: Colors.white),
        ),
         body: TabBarView(children: <Widget>[

         ],)));
  }
}
