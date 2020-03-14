import 'package:fbeta/screens/login.dart';
import 'package:fbeta/screens/register.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(initialRoute: '/', routes: {
      '/': (context) => FirstScreen(),
      '/login': (context) => LoginForm(),
      '/register': (context) => Register()
    });
  }
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              child: Text("Login"),
            ),
            RaisedButton(
              onPressed: () {},
              child: Text("alo"),
            ),
          ],
        ),
      ),
    );
  }
}
