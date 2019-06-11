import 'package:flutter/material.dart';

class CreateProductsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: RaisedButton(child: Text("save"),onPressed: (){
      showModalBottomSheet(context: context,builder: (BuildContext context){
        return Center(child: Text("see the produts here"),);
      });
    },));
  }
}
