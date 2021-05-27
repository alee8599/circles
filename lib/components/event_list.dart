import 'package:flutter/material.dart';
import 'event_card.dart';
import 'dart:convert';
import 'filters.dart';
import 'package:circles/models/event.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EventList extends StatefulWidget {
  bool public;
  final Function top;
  final String userId;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  EventList({this.public, this.userId, this.top});

  @override
  _EventListState createState() => _EventListState();
}

class _EventListState extends State<EventList> {
  bool top = false;
  Future<QuerySnapshot<Object>> _eventsFuture;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.public);
    print(widget.userId);
    _eventsFuture = widget.public
        ? widget.firestore.collection('events').get()
        : widget.firestore
            .collection('events')
            .where('invited', arrayContainsAny: [widget.userId]).get();
    //print(_eventsFuture);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
        future: _eventsFuture,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            List<QueryDocumentSnapshot<Map<String, dynamic>>> eventlist =
                snapshot.data.docs;
            return NotificationListener<DraggableScrollableNotification>(
              // ignore: missing_return
              onNotification: (notification) {
                if (notification.extent > .9) {
                  setState(() {
                    top = true;
                  });
                  widget.top(true);
                  return;
                }
                setState(() {
                  top = false;
                });
                widget.top(false);
              },
              child: DraggableScrollableSheet(
                  initialChildSize: 0.31,
                  minChildSize: 85.0 / MediaQuery.of(context).size.height,
                  maxChildSize: (MediaQuery.of(context).size.height - 60.0) /
                      MediaQuery.of(context).size.height,
                  builder: (BuildContext context,
                      ScrollController scrollController) {
                    return Container(
                      padding: EdgeInsets.only(top: 8.0),
                      child: ListView.builder(
                          itemCount: eventlist.length + 1,
                          controller: scrollController,
                          itemBuilder: (BuildContext context, int index) {
                            if (index == 0) {
                              return Header(top: top);
                            }
                            Event event =
                                Event.createEvent(eventlist[index - 1].data());
                            //print(event.users);
                            return EventCard(widget.userId, event);
                          }),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: top
                            ? BorderRadius.only(
                                topRight: Radius.circular(7.5),
                                topLeft: Radius.circular(7.5))
                            : BorderRadius.only(
                                topRight: Radius.circular(15),
                                topLeft: Radius.circular(15)),
                      ),
                    );
                  }),
            );
          }

          return Container(color: Colors.red);
          /*eventlist.forEach((doc) {
            //print(doc.toString());
          });*/
        });
  }
}

class Header extends StatelessWidget {
  Header({this.top});

  final bool top;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(bottom: 3.0),
          child: AnimatedCrossFade(
            duration: const Duration(milliseconds: 250),
            firstChild: Center(
              child: Image.asset(
                'lib/assets/images/Rectangle 19.jpg',
                height: 10,
                width: 100.0,
              ),
            ),
            secondChild: SizedBox(height: 5.0),
            crossFadeState:
                top ? CrossFadeState.showSecond : CrossFadeState.showFirst,
          ),
        ),
        Container(
            padding: EdgeInsets.only(left: 10.0, top: 5.0, bottom: 3.0),
            child: Filters())
      ],
    );
  }
}
