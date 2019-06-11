import 'package:flutter/material.dart';
import 'dart:async';

class Deatils extends StatelessWidget {
  final String title;
  final String url;

  Deatils(this.title, this.url);

  _Showdilog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("are you sure?"),
            content: Text("this won't undo"),
            actions: <Widget>[
              RaisedButton(
                  child: Text("dicard"),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              RaisedButton(
                  child: Text("continue"),
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context, true);
                  })
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          print("pack");
          Navigator.pop(context, false);
          return Future.value(false);
        },
        child: Scaffold(
            appBar: AppBar(title: Text(title)),
            body: Center(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(url),
                SizedBox(
                  height: 10.0,
                ),
                Text(title),
                SizedBox(
                  height: 10.0,
                ),
                RaisedButton(
                  child: Text("delete"),
                  onPressed: () {
                    _Showdilog(context);
                  },
                )
              ],
            ))));
  }
}
