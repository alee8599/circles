import 'package:flutter/material.dart';
import 'package:circles/theme.dart';
import 'event_card.dart';

class EventList extends StatefulWidget {
  @override
  _EventListState createState() => _EventListState();
}

class _EventListState extends State<EventList> {
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        expand: true,
        initialChildSize: 0.3,
        minChildSize: 0.13,
        maxChildSize: 0.95,
        builder: (BuildContext context, ScrollController scrollController) {
          return Container(
            child: ListView.builder(
                itemCount: 20,
                controller: scrollController,
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0) {
                    return Container(
                      padding: EdgeInsets.all(3.0),
                      child: Image.asset(
                        'lib/assets/images/Rectangle 19.jpg',
                        height: 10,
                        width: 100.0,
                      ),
                    );
                  }

                  return EventCard('event $index', 'host $index', 'test');
                }),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15), topLeft: Radius.circular(15)),
            ),
          );
        });
  }
}
