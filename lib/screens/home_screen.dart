import 'package:circles/screens/events.dart';
import 'package:flutter/material.dart';
import 'placeholder.dart';
import 'package:circles/theme.dart';
import 'dart:math';

class Home extends StatefulWidget {
  @override
  final String userId;
  Home({Key key, @required this.userId}) : super(key: key);

  _HomeState createState() => _HomeState(userId);
}

class _HomeState extends State<Home> {
  final String userId;
  _HomeState(this.userId);

  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    print('userId from home state');
    print(userId);

    final List<Widget> _children = [
      Events(public: true, userId: userId),
      Events(public: false, userId: userId),
      PlaceHolder()
    ];

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
                icon: Transform.rotate(
                    angle: -pi / 4, child: new Icon(Icons.campaign_rounded)),
                label: 'Your Events'),
            BottomNavigationBarItem(
                icon: new Icon(Icons.chat_bubble_outline), label: 'Messages')
          ]),
    );
  }

  void onTabTapped(int index) {
    if (mounted) {
      setState(() {
        _currentIndex = index;
      });
    }
  }
}
