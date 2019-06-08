import 'package:flutter/material.dart';

class Deatils extends StatelessWidget {
  final String title;
  final String url;

  Deatils(this.title,this.url);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(title)),
        body: Center(child: Column(

          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(url),
            SizedBox(height: 10.0,),
            Text(title),
            SizedBox(height: 10.0,),
            RaisedButton(child: Text("delete"),onPressed: (){Navigator.pop(context, true);},)
          ],
        ))
    );
  }
}
