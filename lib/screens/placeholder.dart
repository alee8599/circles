import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:circles/components/event_card.dart';
import 'package:circles/screens/event_screen.dart';
import 'package:circles/components/filters.dart';

import '../models/event.dart';

class PlaceHolder extends StatelessWidget {
  final Color color;

  PlaceHolder(this.color);

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.red);
  }
}

//EventCard('event 1', 'host 1', 'test')
