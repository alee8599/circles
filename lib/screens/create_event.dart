import 'package:circles/theme.dart';
import 'package:flutter/material.dart';

class CreateEvent extends StatefulWidget {
  @override
  _CreateEventState createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
        "Create Your Event",
        textAlign: TextAlign.left,
        style: TextStyle(
            color: Colors.white, fontSize: 30.0, fontFamily: "Kayak Sans"),
        ),
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: WhiteGrey,
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.only(top: 20.0, bottom: 16.0, left: 150.0),
              child: Text(
                "Event Details",
                style: TextStyle(
                  fontSize: 24.0,
                ),
              )),
          Padding(
              padding: EdgeInsets.only(top: 12.0, left: 18.0),
              child: Text("Name", style: TextStyle(fontSize: 20.0))),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, bottom: 20.0),
            child: TextField(
                decoration:
                    InputDecoration(fillColor: WhiteGrey, filled: true)),
          ),
          Padding(
              padding: EdgeInsets.only(top: 8.0, left: 20.0),
              child: Text("Date", style: TextStyle(fontSize: 20.0))),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, bottom: 20.0),
            child: TextField(
                decoration:
                    InputDecoration(fillColor: WhiteGrey, filled: true)),
          ),
          Padding(
              padding: EdgeInsets.only(top: 8.0, left: 20.0),
              child: Text("Time", style: TextStyle(fontSize: 20.0))),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, bottom: 20.0),
            child: TextField(
                decoration:
                    InputDecoration(fillColor: WhiteGrey, filled: true)),
          ),
          Padding(
              padding: EdgeInsets.only(top: 8.0, left: 20.0),
              child: Text("Location", style: TextStyle(fontSize: 20.0))),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, bottom: 20.0),
            child: TextField(
                decoration:
                    InputDecoration(fillColor: WhiteGrey, filled: true)),
          ),
          Padding(
              padding: EdgeInsets.only(top: 8.0, left: 20.0),
              child: Text("Description", style: TextStyle(fontSize: 20.0))),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, bottom: 40.0),
            child: TextField(
                decoration:
                    InputDecoration(fillColor: WhiteGrey, filled: true)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                child: Text(
                  '+ Invite Friends',
                  style: TextStyle(fontSize: 30.0),
                ),
                style: ElevatedButton.styleFrom(
                  primary: RedOrange,
                ),
                onPressed: () {
                  print('Pressed');
                },
              ),
              // ElevatedButton(
              //     child: Text('Sign up'),
              //     style: ElevatedButton.styleFrom(
              //         primary: Theme.of(context).accentColor),
              //     //onPressed: () => _signup(_email, _password))
              // )
            ],
          ),
          Padding(padding: EdgeInsets.only(bottom: 20.0)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                child: Text(
                  'Create Event',
                  style: TextStyle(fontSize: 30.0),
                ),
                style: ElevatedButton.styleFrom(
                  primary: RedOrange,
                ),
                onPressed: () {
                  print('Pressed');
                },
              ),
              // ElevatedButton(
              //     child: Text('Sign up'),
              //     style: ElevatedButton.styleFrom(
              //         primary: Theme.of(context).accentColor),
              //     //onPressed: () => _signup(_email, _password))
              // )
            ],
          )
        ],
      )
    ),
    );
  }
}
