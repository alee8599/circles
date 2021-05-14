import 'package:circles/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _email, _password;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: Column(
          children: [
            Image.asset('lib/assets/images/circles_loginscreen.png',
                fit: BoxFit.cover, width: double.infinity),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(hintText: 'Email'),
                onChanged: (value) {
                  setState(() {
                    _email = value.trim();
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                obscureText: true,
                obscuringCharacter: '*',
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(hintText: 'Password'),
                onChanged: (value) {
                  setState(() {
                    _password = value.trim();
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ConstrainedBox(
                    constraints:
                        BoxConstraints.tightFor(width: 150, height: 50),
                    child: ElevatedButton(
                        child: Text('Sign in'),
                        style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).accentColor,
                            textStyle: TextStyle(fontSize: 20, inherit: false)),
                        onPressed: () => _signin(_email, _password)),
                  ),
                  ConstrainedBox(
                      constraints:
                          BoxConstraints.tightFor(width: 150, height: 50),
                      child: ElevatedButton(
                          child: Text('Sign up'),
                          style: ElevatedButton.styleFrom(
                              primary: Theme.of(context).accentColor,
                              textStyle:
                                  TextStyle(fontSize: 20, inherit: false)),
                          onPressed: () => _signup(_email, _password)))
                ],
              ),
            )
          ],
        ));
  }

  _signin(String _email, String _password) async {
    try {
      await auth.signInWithEmailAndPassword(email: _email, password: _password);

      // Success
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => Home()));
    } on FirebaseAuthException catch (error) {
      print(error.message);
      Fluttertoast.showToast(msg: error.message, gravity: ToastGravity.TOP);
    }
  }

  _signup(String _email, String _password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: _email, password: _password);

      // Success
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => Home()));
    } on FirebaseAuthException catch (error) {
      print(error.message);
      Fluttertoast.showToast(msg: error.message, gravity: ToastGravity.TOP);
    }
  }
}
