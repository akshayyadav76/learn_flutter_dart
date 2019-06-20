import 'package:flutter/material.dart';
import '../module/products_map.dart';

class CreateProductsPage extends StatefulWidget {
  final Function addproduct;
  final Function update;
  ProductsMap products;
  final int index;

  CreateProductsPage({this.addproduct, this.products, this.update, this.index});

  @override
  _CreateProductsPageState createState() => _CreateProductsPageState();
}

class _CreateProductsPageState extends State<CreateProductsPage> {
  //String _data;String _dec;double _price;
  final Map<String, dynamic> _formdata = {
    'title': null,
    'dec': null,
    'price': null,
    'image': 'images/tic.jpg',
  };
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final dv = MediaQuery.of(context).size.width;
    final devicesize = dv > 500.0 ? 400.0 : dv * 0.95;
    final dvpadding = dv - devicesize;
    final Widget page = GestureDetector(
        onTap: () {
          FocusScope.of(context).autofocus(FocusNode());
        },
        child: Container(
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
                ))));
    return widget.products == null
        ? page
        : Scaffold(
            appBar: AppBar(
              title: Text("edit product"),
            ),
            body: page,
          );
  }

  Widget _buildtitle() {
    return TextFormField(
      initialValue: widget.products == null ? "" : widget.products.title,
      //initialValue: widget.products['title'],
      validator: (String value) {
        if (value.isEmpty) {
          return "titiel is required";
        }
      },
      decoration: InputDecoration(labelText: "Product name"),
      //onChanged: (String value) {setState(() {_data = value;});},
      onSaved: (String value) {
        _formdata['title'] = value;
      },
    );
  }

  Widget _bilddec() {
    return TextFormField(
      initialValue: widget.products == null ? "" : widget.products.dec,
      validator: (String value) {
        if (value.isEmpty) {
          return "dec is required";
        }
      },
      decoration: InputDecoration(labelText: "Product dec"),
      maxLines: 4,
      //  onChanged: (String value) {setState(() {_dec = value;});},
      onSaved: (String value) {
        _formdata['dec'] = value;
      },
    );
  }

  Widget _bildprice() {
    return TextFormField(
      initialValue:
          widget.products == null ? "" : widget.products.price.toString(),
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: "Product price"),
      autofocus: true,
      validator: (String value) {
        if (value.isEmpty) {
          return "price is required";
        }
      },
      // onChanged: (String value) {setState(() {_price = double.parse(value);});}
      onSaved: (String value) {
        _formdata['price'] = double.parse(value);
      },
    );
  }

  void _onclick() {
    if (!_formkey.currentState.validate()) {
      return;
    }
    _formkey.currentState.save();
    if (widget.products == null) {
      widget.addproduct(
          ProductsMap(
              title: _formdata["title"],
              dec: _formdata["dec"],
            image: _formdata["image"],
            price: _formdata['price']
          )
      );
    } else {
      widget.update(widget.index, ProductsMap(
          title: _formdata["title"],
          dec: _formdata["dec"],
          image: _formdata["image"],
          price: _formdata['price']
      ));

    }

//    final Map<String, dynamic> producuts = {
//      'title': _data,
//      'dec': _dec,
//      'price': _price,
//      'image': 'images/tic.jpg',
//    };

    print("workng");
    Navigator.pushReplacementNamed(context, 'second');
  }
}
