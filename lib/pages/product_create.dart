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
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final dv = MediaQuery.of(context).size.width;
    final devicesize = dv > 500.0 ? 400.0 : dv * 0.95;
    final dvpadding = dv - devicesize;
    return Container(
        padding: EdgeInsets.symmetric(horizontal: dvpadding / 2),
        child: Form(
            key: _formkey,
            child: ListView(
              children: <Widget>[
                _buildtitle(),
                _bilddec(),
                _bildprice(),

                RaisedButton(
                  onPressed: () {
                    _onclick();
                  },
                  child: Text("save"),
                )
                //Text(data),
              ],
            )));
  }

  Widget _buildtitle() {
    return TextFormField(
      autofocus: true,
      decoration: InputDecoration(labelText: "Product name"),
      //onChanged: (String value) {setState(() {_data = value;});},
      onSaved: (String value) {
        setState(() {
          _data = value;
        });
      },
    );
  }

  Widget _bilddec() {
    return TextFormField(
      autofocus: true,
      decoration: InputDecoration(labelText: "Product dec"),
      maxLines: 4,
      //  onChanged: (String value) {setState(() {_dec = value;});},
      onSaved: (String value) {
        setState(() {
          _dec = value;
        });
      },
    );
  }

  Widget _bildprice() {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: "Product price"),
      autofocus: true,
      // onChanged: (String value) {setState(() {_price = double.parse(value);});}
      onSaved: (String value) {
        setState(() {
          _price = double.parse(value);
        });
      },
    );
  }

  void _onclick() {
    _formkey.currentState.save();
    final Map<String, dynamic> producuts = {
      'title': _data,
      'dec': _dec,
      'price': _price,
      'image': 'images/tic.jpg',
    };
    widget.addproduct(producuts);
    print("workng");
    Navigator.pushReplacementNamed(context, 'second');
  }
}
