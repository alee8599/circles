import 'package:circles/screens/login.dart';
import 'package:circles/screens/your_events.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'placeholder.dart';
import 'package:circles/theme.dart';
import 'explore.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

final auth = FirebaseAuth.instance;

class _HomeState extends State<Home> {
  int _currentIndex = 1;
  final List<Widget> _children = [
    Explore(),
    YourEvents(),
    PlaceHolder(Colors.blue)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(
        children: [
          TextButton(
              onPressed: () {
                auth.signOut();
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
              child: Text('Logout')),
        ],
      )),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          currentIndex: _currentIndex,
          showSelectedLabels: true,
          selectedItemColor: RedOrange,
          unselectedLabelStyle: TextStyle(color: Grey),
          unselectedItemColor: Grey,
          onTap: onTabTapped,
          items: [
            BottomNavigationBarItem(
                icon: new Icon(Icons.search), label: 'Explore'),
            BottomNavigationBarItem(
                icon: new Icon(Icons.home), label: 'Your Events'),
            BottomNavigationBarItem(
                icon: new Icon(Icons.chat_bubble_outline), label: 'Messages')
          ]),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
