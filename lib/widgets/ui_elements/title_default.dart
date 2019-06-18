import 'package:flutter/material.dart';

class TitleDefulat extends StatelessWidget {
  final String title;
  TitleDefulat(this.title);
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20),
    );
  }
}
