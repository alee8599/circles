import 'package:circles/models/circles.dart';
import 'package:circles/models/firestore_service.dart';
import 'package:circles/screens/invite_friends_create_event.dart';
import 'package:circles/screens/your_events.dart';
import 'package:circles/theme.dart';
import 'package:flutter/material.dart';
import 'package:circles/screens/coming_soon.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:circles/models/event.dart';
import 'package:place_picker/place_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'home_screen.dart';

class CreateEvent extends StatefulWidget {
  String userId;

  CreateEvent({this.userId});
  @override
  _CreateEventState createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  String id = FirestoreService.getRandomString(20);
  String hostName;
  String description;
  DateTime datetime;
  String eventName;
  double lat = 39.4276;
  double long = -124.0;
  List<String> invited = [];

  @override
  Widget build(BuildContext context) {
    /*void setPermissions() async {
      Map<PermissionGroup, PermissionStatus> permissions =
          await PermissionHandler()
              .requestPermissions([PermissionGroup.location]);
    }*/

    void showPlacePicker() async {
      LocationResult result = await Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context) => PlacePicker(
                  "AIzaSyAWav5nFZB0k0hrEnwLk-WD-Yj780OoNg4",
                  displayLocation: LatLng(37.4276, -122.16))));
      print('result of location picker');
      print(result.toString());

      var latlong;
      if (result != null) {
        latlong = result.latLng;
        lat = latlong.latitude;
        long = latlong.longitude;
      } else
        print('result is null');
    }

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "Create Your Event",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
                fontSize: 30.0,
                fontFamily: "Kayak Sans"),
          ),
          automaticallyImplyLeading: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: RedOrange,
            onPressed: () => Navigator.of(context).maybePop(),
          ),
        ),
        body: Form(showPlacePicker, context));
  }

  ListView Form(void showPlacePicker(), BuildContext context) {
    return ListView(
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
            child: Text("Host Name", style: TextStyle(fontSize: 20.0))),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, bottom: 20.0),
          child: TextFormField(
              onChanged: (value) => {hostName = value},
              validator: (value) {
                return (value != null) ? "Needs to be filled out" : null;
              },
              decoration: InputDecoration(fillColor: WhiteGrey, filled: true)),
        ),
        Padding(
            padding: EdgeInsets.only(top: 12.0, left: 18.0),
            child: Text("Event Name", style: TextStyle(fontSize: 20.0))),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, bottom: 20.0),
          child: TextField(
              onChanged: (value) => {eventName = value},
              decoration: InputDecoration(fillColor: WhiteGrey, filled: true)),
        ),
        Padding(
            padding: EdgeInsets.only(top: 8.0, left: 20.0),
            child: Text("Description", style: TextStyle(fontSize: 20.0))),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, bottom: 20.0),
          child: TextField(
              onChanged: (value) => {description = value},
              decoration: InputDecoration(fillColor: WhiteGrey, filled: true)),
        ),
        Center(
            child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Green,
          ),
          child: Text(
            "Pick Location (does not save location yet)",
            style: TextStyle(fontSize: 20.0),
          ),
          onPressed: () {
            showPlacePicker();
          },
        )),
        Container(
            padding: const EdgeInsets.only(left: 8.0, bottom: 20.0, right: 8.0),
            child: DateTimePicker(
              type: DateTimePickerType.dateTimeSeparate,
              dateMask: 'd MMM, yyyy',
              initialValue: DateTime.now().toString(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2100),
              icon: Icon(Icons.event),
              dateLabelText: 'Day',
              timeLabelText: "Time",
              onChanged: (val) {
                datetime = DateTime.parse(val);
                print(datetime.toString());
              },
              onSaved: (val) {
                datetime = DateTime.parse(val);
              },
            )),
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: ElevatedButton(
              child: Text(
                '+ Invite Friends',
                style: TextStyle(fontSize: 30.0),
              ),
              style: ElevatedButton.styleFrom(
                primary: Green,
              ),
              onPressed: () async {
                invited = await Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => InviteCreateFriends()));
                invited.add(widget.userId);
                invited = invited.toSet().toList();
              },
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: ElevatedButton(
              child: Text(
                'Create Event',
                style: TextStyle(fontSize: 30.0),
              ),
              style: ElevatedButton.styleFrom(
                primary: RedOrange,
              ),
              onPressed: () {
                Event newEvent = Event(
                  id: id,
                  name: eventName,
                  host: hostName,
                  dateTime: datetime == null ? DateTime.now() : datetime,
                  description: description,
                  latitude: lat,
                  longitude: long,
                  invited: invited,
                  going: [widget.userId],
                  rejected: [],
                );
                FirestoreService.addEvent(newEvent);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Home(
                            userId: widget.userId,
                          )),
                );
              },
            ),
          ),
        )
      ],
    );
  }
}
