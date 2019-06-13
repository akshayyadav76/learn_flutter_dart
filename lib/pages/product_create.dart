import 'package:flutter/material.dart';

class CreateProductsPage extends StatefulWidget {
  final Function addproduct;
  CreateProductsPage(this.addproduct);

  @override
  _CreateProductsPageState createState() => _CreateProductsPageState();
}

class _CreateProductsPageState extends State<CreateProductsPage> {
  String _data;
  String _dec;
  double _price;

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
              _data = value;
            });
          },
        ),
        TextField(
          autofocus: true,
          decoration: InputDecoration(labelText: "Product dec"),
          maxLines: 4,
          onChanged: (String value) {
            setState(() {
              _dec = value;
            });
          },
        ),
        TextField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(labelText: "Product price"),
          autofocus: true,
          onChanged: (String value) {
            setState(() {
              _price = double.parse(value);
            });
          },
        ),
        RaisedButton(onPressed: (){
          final Map<String,dynamic> producuts ={
            'title': _data,
            'dec': _dec,
            'price': _price,
            'image': 'images/tic.jpg',
          };
          widget.addproduct(producuts);
          print("workng");
          Navigator.pushReplacementNamed(context, '/');
        },child: Text("save"),)
        //Text(data),
      ],
    ));
  }
}
