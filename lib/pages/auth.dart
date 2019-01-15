import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() {
    return new _AuthPageState();
  }
}

class _AuthPageState extends State<AuthPage> {
  String _emailAddress;
  String _password;
  bool _acceptTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Container(
          margin: EdgeInsets.all(12.0),
          child: ListView(
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'E-mail'),
                keyboardType: TextInputType.emailAddress,
                onChanged: (String value) {
                  setState(() {
                    this._emailAddress = value;
                  });
                },
              ),
              TextField(
                obscureText: true,
                decoration: InputDecoration(labelText: 'Senha'),
                onChanged: (String value) {
                  setState(() {
                    this._password = value;
                  });
                },
              ),
              SwitchListTile(
                title: Text('Accept Terms'),
                value: _acceptTerms,
                onChanged: (bool value) {
                  setState(() {
                    this._acceptTerms = value;
                  });
                },
              ),
              SizedBox(height: 5.0),
              RaisedButton(
                color: Theme.of(context).accentColor,
                textColor: Colors.white,
                child: Text('LOGIN'),
                onPressed: () {
                  print("E-mail: $_emailAddress.");
                  print("Password: $_password.");
                  Navigator.pushReplacementNamed(context, '/products');
                },
              ),
            ],
          )),
    );
  }
}
