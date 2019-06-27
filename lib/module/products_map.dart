import 'package:flutter/material.dart';

class ProductsMap {
  final String title;
  final String dec;
  final double price;
  final String image;
  final bool isFavorite;

  ProductsMap(
      {@required this.title,
      @required this.dec,
      @required this.price,
      @required this.image,
      this.isFavorite = false});
}
