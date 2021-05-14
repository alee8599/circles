import 'package:flutter/material.dart';
import 'package:circles/theme.dart';
import 'event_card.dart';
import 'filters.dart';
import 'package:circles/screens/create_event.dart';

class EventList extends StatefulWidget {
  bool public;

  EventList({this.public});

  @override
  _EventListState createState() => _EventListState();
}

class _EventListState extends State<EventList> {
  bool top = false;

  @override
  Widget build(BuildContext context) {
    return NotificationListener<DraggableScrollableNotification>(
      // ignore: missing_return
      onNotification: (notification) {
        if (notification.extent > .85) {
          setState(() {
            if (!top) top = true;
          });
        } else if (top) top = false;
      },
      child: DraggableScrollableSheet(
          initialChildSize: 0.31,
          minChildSize: 0.13,
          maxChildSize: 1.0,
          builder: (BuildContext context, ScrollController scrollController) {
            return Container(
              padding: EdgeInsets.only(top: 8.0),
              child: ListView.builder(
                  itemCount: 20,
                  controller: scrollController,
                  itemBuilder: (BuildContext context, int index) {
                    if (index == 0) {
                      return Header(top: top);
                    }
                    return EventCard(
                        'event ${index - 1}', 'host ${index - 1}', 'test');
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
}

class Header extends StatelessWidget {
  const Header({
    Key key,
    @required this.top,
  }) : super(key: key);

  final bool top;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(bottom: 3.0),
          child: AnimatedCrossFade(
            duration: const Duration(milliseconds: 300),
            firstChild: Center(
              child: Image.asset(
                'lib/assets/images/Rectangle 19.jpg',
                height: 10,
                width: 100.0,
              ),
            ),
            secondChild: LogoButton(),
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

class LogoButton extends StatelessWidget {
  const LogoButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 10.0, left: 15.0, right: 15.0),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('circles',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 45,
                      fontWeight: FontWeight.bold)),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CreateEvent()),
                  );
                },
                child: Icon(Icons.add, color: Colors.white),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Yellow)),
              )
            ]));
  }
}
