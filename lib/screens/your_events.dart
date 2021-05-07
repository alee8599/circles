import 'package:circles/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
                    color: Grey,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15),
                        topLeft: Radius.circular(15)),
                  ),
                ));
          })
    ]));
  }
}
