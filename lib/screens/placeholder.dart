import 'package:flutter/material.dart';
import 'home_screen.dart';

class PlaceHolder extends StatelessWidget {
  final Color color;

  PlaceHolder(this.color);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: color,
    ));
  }
}
