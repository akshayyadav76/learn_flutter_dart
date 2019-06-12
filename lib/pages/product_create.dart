import 'package:flutter/material.dart';

class CreateProductsPage extends StatefulWidget {
  @override
  _CreateProductsPageState createState() => _CreateProductsPageState();
}

class _CreateProductsPageState extends State<CreateProductsPage> {
  String data;
  String dec;
  double price;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(14.0),
        child: ListView(
      children: <Widget>[
        TextField(
          autofocus: true,
          decoration: InputDecoration(labelText: "Product name"),
          onChanged: (String value) {
            setState(() {
              data = value;
            });
          },
        ),
        TextField(
          autofocus: true,
          decoration: InputDecoration(labelText: "Product dec"),
          maxLines: 4,
          onChanged: (String value) {
            setState(() {
              dec = value;
            });
          },
        ),
        TextField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(labelText: "Product price"),
          autofocus: true,
          onChanged: (String value) {
            setState(() {
              price = double.parse(value);
            });
          },
        ),
        RaisedButton(onPressed: (){},child: Text("save"),)
        //Text(data),
      ],
    ));
  }
}
