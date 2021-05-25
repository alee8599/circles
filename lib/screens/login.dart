import 'package:circles/models/auth_service.dart';
import 'package:circles/screens/home_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:circles/models/firestore_service.dart';
import 'package:circles/models/user_model.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _email, _password, _name;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              SizedBox(
                height: 20.0,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset(
                      'lib/assets/images/circles_loginscreen.png',
                      fit: BoxFit.contain,
                      width: MediaQuery.of(context).size.width),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      hintText: 'First and Last Name (only used for sign-up)'),
                  onChanged: (value) {
                    if (mounted) {
                      setState(() {
                        _name = value.trim();
                      });
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(hintText: 'Email'),
                  onChanged: (value) {
                    if (mounted) {
                      setState(() {
                        _email = value.trim();
                      });
                    }
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
                    if (mounted) {
                      setState(() {
                        _password = value.trim();
                      });
                    }
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
                              textStyle:
                                  TextStyle(fontSize: 20, inherit: false)),
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
          )),
    );
  }

  _signin(String _email, String _password) async {
    try {
      var authResult = await auth.signInWithEmailAndPassword(
          email: _email, password: _password);

      // Make a new authentication service model and populate the current user
      AuthenticationService _authService = new AuthenticationService();
      //    print(authResult.user.uid);
      await _authService.populateCurrentUser(authResult.user.uid);
//      print(_authService.currentUser);

      FirestoreService service = new FirestoreService();

      // Success
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => Home(userId: _authService.currentUser.id)));
    } on FirebaseAuthException catch (error) {
      print(error.message);
      Fluttertoast.showToast(msg: error.message, gravity: ToastGravity.TOP);
    }
  }

  _signup(String _email, String _password) async {
    try {
      var authResult = await auth.createUserWithEmailAndPassword(
          email: _email, password: _password);

      // Success
      FirestoreService _firestoreService = new FirestoreService();

      try {
        await _firestoreService.createUser(CirclesUser(
            id: authResult.user.uid,
            name: _name,
            email: _email,
            imageUrl: 'lib/assets/images/penguin.jpg'));
        return authResult.user != null;
      } catch (e) {
        print('here');
        print(e);
      }

      // Make a new authentication service model and populate the current user
      AuthenticationService _authService = new AuthenticationService();
      await _authService.populateCurrentUser(authResult.user.uid);

      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => Home(userId: _authService.currentUser.id)));
    } on FirebaseAuthException catch (error) {
      print(error.message);
      Fluttertoast.showToast(msg: error.message, gravity: ToastGravity.TOP);
    }
  }
}
