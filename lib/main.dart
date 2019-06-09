import 'package:flutter/material.dart';
import './pages/login.dart';


main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
        brightness: Brightness.light,
          primarySwatch: Colors.lightBlue,
accentColor: Colors.white,
        ),

    home: Scaffold( body:
    Login()));
  }
}
