import 'package:circles/screens/circles_page.dart';
import 'package:flutter/material.dart';
import 'package:circles/theme.dart';
import 'package:circles/screens/coming_soon.dart';
import 'package:circles/screens/login.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DrawerMenu extends StatelessWidget {
  final auth = FirebaseAuth.instance;

  final String userId;
  DrawerMenu(this.userId);

  @override
  Widget build(BuildContext context) {
//    print("user id from drawer menu");
    //  print(userId);

    return Scaffold(
      backgroundColor: WhiteGrey,
      body: Drawer(
          child: ListView(padding: EdgeInsets.zero, children: <Widget>[
        DrawerHeader(
            child: Text('circles',
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 45,
                    fontWeight: FontWeight.bold))),
        ListTile(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => ComingSoon()));
          },
          title: Text('Profile',
              style: TextStyle(
                  fontSize: 25, color: Theme.of(context).primaryColor)),
        ),
        ListTile(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => CirclesPage(userId: userId)));
          },
          title: Text('Your Circles',
              style: TextStyle(
                  fontSize: 25, color: Theme.of(context).primaryColor)),
        ),
        ListTile(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => ComingSoon()));
          },
          title: Text('Settings',
              style: TextStyle(
                  fontSize: 25, color: Theme.of(context).primaryColor)),
        ),
        SizedBox(height: 40),
        SizedBox(height: 40),
        SizedBox(height: 40),
        SizedBox(height: 40),
        SizedBox(height: 20),
        ListTile(
          onTap: () {
            auth.signOut();
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => LoginScreen()));
          },
          title: Text('Logout',
              style: TextStyle(
                  color: Theme.of(context).primaryColor, fontSize: 30.0)),
        )
      ])),
    );
  }
}
