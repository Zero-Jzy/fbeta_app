import 'package:flutter/material.dart';

import '../custom_icon.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
            color: Colors.black,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          color: Colors.transparent,
          padding: EdgeInsets.fromLTRB(20, 100, 20, 0),
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 40),
                    child: Image.asset('assets/fbeta.png'),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: "Email",
                        fillColor: Colors.white,
                        hintText: "Enter your email",
                        border: OutlineInputBorder(
//                            borderRadius: BorderRadius.circular(25)
                            )
                    ),
                    validator: validateEmail,
                    onSaved: (value) => _email = value,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: "Password",
                        hintText: "Enter your password",
                        border: OutlineInputBorder(
//                            borderRadius: BorderRadius.circular(25)
                        )
                    ),
                    validator: validatePassword,
                    onSaved: (value) => _password = value,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: <Widget>[
                      Ink(
                        decoration: const ShapeDecoration(
                          color: Colors.lightBlue,
                          shape: CircleBorder(),
                        ),
                        child: IconButton(
                            tooltip: "ALo 123",
                            color: Colors.white,
                            icon: Icon(CustomIcon.facebook),
                            onPressed: () {}),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Ink(
                        decoration: const ShapeDecoration(
                          color: Colors.lightBlue,
                          shape: CircleBorder(),
                        ),
                        child: IconButton(
                            color: Colors.white,
                            icon: Icon(CustomIcon.google),
                            onPressed: () {}),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      RaisedButton(
                        color: Colors.amber,
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 30),
//                        shape: RoundedRectangleBorder(
//                          borderRadius: BorderRadius.circular(25),
//                        ),
                        elevation: 3,
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            _formKey.currentState.save();
                            print(_email);
                            print(_password);
                          }
                          ;
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(fontSize: 24, color: Colors.white),
                        ),
                      ),
                    ],
                  )
                ]),
          ),
        ),
      ),
    );
  }

  String validateEmail(String value) {
    Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)'
        r'|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])'
        r'|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter is not valid!';
    else
      return null;
  }

  String validatePassword(String value) {
    if (value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 6) {
      return 'Must be more than 6 charater';
    }
    return null;
  }
}
