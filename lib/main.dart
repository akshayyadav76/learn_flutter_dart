import 'package:flutter/material.dart';
import './pages/login.dart';


main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.lightBlue),
    home: Scaffold( body:
    Login()));
  }
}
