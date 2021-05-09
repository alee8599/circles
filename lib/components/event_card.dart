import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  final String eventName;
  final String eventHost;
  final String othersText;

  EventCard(this.eventName, this.eventHost, this.othersText);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.0,
      child: Card(
          elevation: 3,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
          margin: EdgeInsets.symmetric(vertical: 5, horizontal: 7),
          child: Row(children: <Widget>[
            Container(
              padding: EdgeInsets.all(12.0),
              width: 200.0,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(6.0),
                  child: Image.asset('lib/assets/images/Finished.jpg',
                      fit: BoxFit.cover)),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4.0),
                      child: Text(
                        eventName,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                            color: Theme.of(context).primaryColor),
                      ),
                    ),
                    Text(
                      eventHost,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15.0),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(othersText,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12.0))
                  ],
                ),
              ),
            )
          ])),
    );
  }
}
