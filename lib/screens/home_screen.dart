import 'package:circles/screens/your_events.dart';
import 'package:flutter/material.dart';
import 'placeholder.dart';
import 'package:circles/theme.dart';
import 'explore.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 1;
  final List<Widget> _children = [
    Explore(),
    YourEvents(),
    PlaceHolder(Colors.green)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          showSelectedLabels: true,
          selectedItemColor: RedOrange,
          unselectedLabelStyle: TextStyle(color: Grey),
          unselectedItemColor: Grey,
          onTap: onTabTapped,
          items: [
            BottomNavigationBarItem(
                icon: new Icon(Icons.search), title: new Text('Explore')),
            BottomNavigationBarItem(
                icon: new Icon(Icons.home), title: new Text('Your Events')),
            BottomNavigationBarItem(
                icon: new Icon(Icons.chat_bubble_outline),
                title: new Text('Messages'))
          ]),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
