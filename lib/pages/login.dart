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
        body: DecoratedBox(
            decoration: BoxDecoration(
                image: _BuildBackgroudImage()),

            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 20,),
                   _BildEmail(),
                    SizedBox(height: 20,),
                    _BuildPass(),
                    _BuildSwitch(),
                    RaisedButton(
                        child: Text("Login"),
                        onPressed: _onSubmit ),
                  ],
                ),
              ),
            )));
  }

  DecorationImage _BuildBackgroudImage(){
    return DecorationImage(
        image: AssetImage('images/bg.jpg'),
        fit: BoxFit.fill,
        colorFilter: ColorFilter.mode(
            Colors.brown.withOpacity(0.7), BlendMode.dstATop));
  }
  Widget _BildEmail(){
    return  Container(
      decoration: BoxDecoration(color: Colors.white),
      child: TextField(
        autofocus: true,
        decoration: InputDecoration(labelText: "E-mail"),
        onChanged: (String value) {
          setState(() {
            _id = value;
          });
        },
      ),
    );
  }
  Widget _BuildPass(){
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: TextField(
        autofocus: true,
        decoration: InputDecoration(labelText: "password"),
        onChanged: (String value) {
          setState(() {
            _pass = value;
          });
        },
      ),
    );
  }
  Widget _BuildSwitch(){
    return SwitchListTile(
        value: _accept,
        onChanged: (bool value) {
          setState(() {
            _accept = value;
          });
        },
        title: Text(
          "accept terms & conditions",
          style: TextStyle(fontWeight: FontWeight.w700),
        ));
  }
  void _onSubmit(){
     Navigator.pushReplacementNamed(context, 'second');
  }




}
