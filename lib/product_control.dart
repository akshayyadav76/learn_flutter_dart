import 'package:flutter/material.dart';


class ProductControl extends StatelessWidget {
  final Function addproducts;

      ProductControl(this.addproducts);
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Theme.of(context).primaryColor,
      child: Text("click"),
      onPressed: (){
          addproducts("sweets");
      },
    );
  }
}
