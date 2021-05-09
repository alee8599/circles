import 'package:circles/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:circles/components/event_list.dart';

class Explore extends StatefulWidget {
  @override
  _Explore createState() => _Explore();
}

class _Explore extends State<Explore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Image.asset('lib/assets/images/penguin.jpg',
          fit: BoxFit.fill, width: double.infinity),
      EventList()
    ]));
  }
}
