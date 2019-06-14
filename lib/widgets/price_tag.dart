import 'package:flutter/material.dart';

class Price_tag extends StatelessWidget {
  final String price;
  Price_tag(this.price);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.deepPurple)),
      child: Text('\$$price',
        style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20),),
    );

  }
}
