import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String _id;
  String _pass;
  bool _accept = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          TextField(
            autofocus: true,
            decoration: InputDecoration(labelText: "E-mail"),
            onChanged: (String value) {
              setState(() {
                _id =value;
              });
            },
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            autofocus: true,
            decoration: InputDecoration(labelText: "password"),
            onChanged: (String value) {
              setState(() {
                _pass = value;
              });
            },
          ),
          SwitchListTile(
              value: _accept,
              onChanged: (bool value) {
                setState(() {
                  _accept = value;
                });
              },
              title: Text("accept terms & conditions")),
          RaisedButton(
              child: Text("Login"),
              onPressed: () {
                Navigator.pushReplacementNamed(context, 'second');
              }),
        ],
      ),
    );
  }
}
