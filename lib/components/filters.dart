import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:circles/theme.dart';

class Filters extends StatefulWidget {
  @override
  _FiltersState createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  int pressedButton = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset('lib/assets/images/sort.png', width: 40.0, height: 40.0),
        Container(
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 3.0),
              height: 45.0,
              width: 360.0,
              child:
                  ListView(scrollDirection: Axis.horizontal, children: <Widget>[
                filterButton('Today', pressedButton, 0),
                filterButton('Tomorrow', pressedButton, 1),
                filterButton('Weekend', pressedButton, 2)
              ])),
        ),
      ],
    );
  }

  Widget filterButton(String text, int pressedNum, int index) {
    bool pressed = pressedNum == index;

    return Container(
        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
        child: ElevatedButton(
          onPressed: () => {
            setState(() {
              pressedButton = index;
            })
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3.0),
            child: Text(text,
                style: TextStyle(
                    color: pressed ? WhiteGrey : Grey,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold)),
          ),
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(pressed ? Green : WhiteGrey),
              side: MaterialStateProperty.all<BorderSide>(pressed
                  ? BorderSide(width: 3.0, color: Green)
                  : BorderSide(width: 3.0, color: Grey)),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0)))),
        ));
  }
}
