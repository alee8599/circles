import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:circles/components/event_card.dart';
import 'package:circles/screens/event_screen.dart';
import 'package:circles/components/filters.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../models/event.dart';

class PlaceHolder extends StatelessWidget {
  final Color color;

  PlaceHolder(this.color);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
          child: SvgPicture.asset(
        'lib/assets/SVGs/Menu SVG.svg',
        color: Theme.of(context).primaryColor,
        semanticsLabel: 'Menu Icon',
      )),
    );
  }
}

//EventCard('event 1', 'host 1', 'test')
