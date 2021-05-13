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
          style: TextStyle(color: Colors.white, fontSize: 30.0),
        )),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 16.0, left: 8.0),
                child: Text(
                  "Event Details",
                  style: TextStyle(
                    fontSize: 24.0, // insert your font size here
                  ),
                )),
            Padding(
                padding: EdgeInsets.only(top: 12.0, left: 8.0),
                child: Text("Name", style: TextStyle(fontSize: 20.0))),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                //decoration: InputDecoration(hintText: 'Email'),
                // onChanged: (value) {
                //   setState(() {
                //     _email = value.trim();
                //   });
                // },
              ),
            ),
            Padding(
                padding: EdgeInsets.only(top: 8.0, left: 8.0),
                child: Text("Date", style: TextStyle(fontSize: 20.0))),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: TextField(
                obscureText: true,
              ),
            ),
            Padding(
                padding: EdgeInsets.only(top: 8.0, left: 8.0),
                child: Text("Time", style: TextStyle(fontSize: 20.0))),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: TextField(
                obscureText: true,
              ),
            ),
            Padding(
                padding: EdgeInsets.only(top: 8.0, left: 8.0),
                child: Text("Location", style: TextStyle(fontSize: 20.0))),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: TextField(
                obscureText: true,
              ),
            ),
            Padding(
                padding: EdgeInsets.only(top: 8.0, left: 8.0),
                child: Text("Description", style: TextStyle(fontSize: 20.0))),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, bottom: 40.0),
              child: TextField(obscureText: true),
            ),
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
        ));
  }
}
