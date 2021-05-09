import 'package:flutter/material.dart';
import 'package:circles/theme.dart';
import 'event_card.dart';
import 'filters.dart';

class EventList extends StatefulWidget {
  @override
  _EventListState createState() => _EventListState();
}

class _EventListState extends State<EventList> {
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        expand: true,
        initialChildSize: 0.31,
        minChildSize: 0.15,
        maxChildSize: 0.995,
        builder: (BuildContext context, ScrollController scrollController) {
          return Container(
            padding: EdgeInsets.only(top: 8.0),
            child: ListView.builder(
                itemCount: 20,
                controller: scrollController,
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0) {
                    return Container(
                      padding: EdgeInsets.only(bottom: 3.0),
                      child: Image.asset(
                        'lib/assets/images/Rectangle 19.jpg',
                        height: 10,
                        width: 100.0,
                      ),
                    );
                  } else if (index == 1) {
                    return Container(
                        padding:
                            EdgeInsets.only(left: 10.0, top: 5.0, bottom: 3.0),
                        child: Filters());
                  }

                  return EventCard(
                      'event ${index - 1}', 'host ${index - 1}', 'test');
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
