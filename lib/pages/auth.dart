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
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/background.jpg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.3),
                BlendMode.dstATop,
              ),
            ),
          ),
          padding: EdgeInsets.all(12.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                        labelText: 'E-Mail',
                        filled: true,
                        fillColor: Colors.white),
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (String value) {
                      setState(() {
                        this._emailAddress = value;
                      });
                    },
                  ),
                  SizedBox(height: 12.0,),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      filled: true,
                      fillColor: Colors.white
                    ),
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
              ),
            ),
          )),
    );
  }
}
