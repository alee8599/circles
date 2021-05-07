import 'package:flutter/material.dart';
import 'package:circles/screens/home_screen.dart';
import 'theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Circles',
      theme: MyTheme.defaultTheme,
      home: Home(),
    );
  }
}
