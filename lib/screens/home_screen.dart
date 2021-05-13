import 'package:circles/screens/events.dart';
import 'package:flutter/material.dart';
import 'placeholder.dart';
import 'package:circles/theme.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 1;
  final List<Widget> _children = [
    Events(public: true),
    Events(public: false),
    PlaceHolder()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
