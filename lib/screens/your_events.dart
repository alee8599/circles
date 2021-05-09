import 'package:circles/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:circles/components/event_list.dart';

class YourEvents extends StatefulWidget {
  @override
  _YourEventsState createState() => _YourEventsState();
}

class _YourEventsState extends State<YourEvents> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Image.asset('lib/assets/images/Finished.jpg',
          fit: BoxFit.fill, width: double.infinity),
      EventList()
    ]));
  }
}
