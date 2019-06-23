import 'package:flutter/material.dart';
import 'package:learn_flutter_dart/module/products_map.dart';
import 'package:scoped_model/scoped_model.dart';

import "../pages/scoped model/scoped_model.dart";







class CreateProductsPage extends StatefulWidget {

//  final Function addproduct;
//  final Function update;
//  ProductsMap products;
//  final int index;
//  CreateProductsPage({this.addproduct, this.products, this.update, this.index});

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

    return ScopedModelDescendant<ProductModel>(builder: (BuildContext context,Widget child,ProductModel model){
      final Widget page = _buildPageContent(context,model.selectedProduct);
      return model.selectedProductReturn == null
          ? page
          : Scaffold(
        appBar: AppBar(
          title: Text("edit product"),
        ),
        body: page,
      );
    });

  }


  Widget _buildPageContent(BuildContext context ,ProductsMap products){
    final dv = MediaQuery.of(context).size.width;
    final devicesize = dv > 500.0 ? 400.0 : dv * 0.95;
    final dvpadding = dv - devicesize;
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).autofocus(FocusNode());
        },
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: dvpadding / 2),
            child: Form(
                key: _formkey,
                child: ListView(
                  children: <Widget>[
                    _buildtitle(products),
                    _bilddec(products),
                    _bildprice(products),
                    _submitFromButton(products),


                    //Text(data),
                  ],
                ))));
  }

  Widget _buildtitle(ProductsMap products) {
    return TextFormField(
      initialValue: products == null ? "" : products.title,
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

  Widget _bilddec(ProductsMap products) {
    return TextFormField(
      initialValue: products == null ? "" : products.dec,
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

  Widget _bildprice(ProductsMap products) {
    return TextFormField(
      initialValue:
         products == null ? "" : products.price.toString(),
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

  void _onclick(Function addproduct,Function update,[int selectedProductIndex]) {
    if (!_formkey.currentState.validate()) {
      return;
    }
    _formkey.currentState.save();
    if (selectedProductIndex == null) {
      addproduct(
          ProductsMap(
              title: _formdata["title"],
              dec: _formdata["dec"],
            image: _formdata["image"],
            price: _formdata['price']
          )
      );
    } else {
      update( ProductsMap(
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

  Widget _submitFromButton(ProductsMap products){
    return ScopedModelDescendant<ProductModel>(builder: (BuildContext context,Widget child,ProductModel model){
      return RaisedButton(
        onPressed: () {
          _onclick(model.addproduct,model.update,model.selectedProductReturn);
        },
        child: Text("save"),
      );
    });
  }


}
