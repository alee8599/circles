import 'package:circles/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      DraggableScrollableSheet(
          initialChildSize: 0.3,
          minChildSize: 0.13,
          maxChildSize: 0.9,
          builder: (BuildContext context, ScrollController scrollController) {
            return Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Container(
                  child: ListView.builder(
                      itemCount: 20,
                      controller: scrollController,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title: Text('Event ${index + 1}'),
                          trailing: Icon(Icons.event),
                        );
                      }),
                  decoration: BoxDecoration(
                    color: Green,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15),
                        topLeft: Radius.circular(15)),
                  ),
                ));
          })
    ]));
  }
}
