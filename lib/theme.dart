import 'package:flutter/material.dart';

const RedOrange = const Color(0xFFFE654F);
const Yellow = const Color(0xFFF4CE52);
const Green = const Color(0xFF7CA982);
const WhiteGrey = const Color(0xFFF5F5F5);
const Grey = const Color(0xFFCBCDCD);
const ReadTextGrey = const Color(0x999A9A);
const GreyBlack = const Color(0x282928);

class MyTheme {
  static final ThemeData defaultTheme = _buildMyTheme();

  static ThemeData _buildMyTheme() {
    final ThemeData base = ThemeData.light();

    return base.copyWith(
        accentColor: Green,
        primaryColor: RedOrange,
        primaryTextTheme: base.textTheme.apply(
            displayColor: GreyBlack,
            bodyColor: GreyBlack,
            decorationColor: GreyBlack),
        buttonTheme: base.buttonTheme.copyWith(buttonColor: Green),
        textSelectionColor: RedOrange,
        backgroundColor: Colors.white,
        textTheme: base.textTheme.apply(fontFamily: 'Kayak Sans'));
  }
}
