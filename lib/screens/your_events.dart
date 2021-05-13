import 'package:circles/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:circles/components/event_list.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:math';

class YourEvents extends StatefulWidget {
  @override
  _YourEventsState createState() => _YourEventsState();
}

class _YourEventsState extends State<YourEvents> {
  @override
  List<Marker> allMarkers = [];
  Map<double, String> markerIds = {};

  void initState() {
    super.initState();
    //  DocumentSnapshot variable = await Firestore.instance.('events');
    fetchMarkersList();
  }

  fetchMarkersList() async {
    dynamic list = await getMarkersList();
    if (list == null) {
      print("unable to retrieve marker list");
    } else {
      setState(() {
        allMarkers = list;
      });
    }
  }

  static const _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random _rnd = Random();

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

  Future getMarkersList() async {
    List<Marker> markerlist = [];

    try {
      final events =
          await FirebaseFirestore.instance.collection('events').get();

      for (var query in events.docs) {
//        print(query.data());
        double lat = query.data()['latitude'].toDouble();
        double lng = query.data()['longitude'].toDouble();
        String name = query.data()['name'].toString();
        String host = query.data()['host'].toString();
        String description = query.data()['description'].toString();

//        print(lat);
//        print(lng);

        String markerId = getRandomString(10);

        if (!markerIds.containsKey(lat)) {
          markerIds[lat] = getRandomString(10);
        }

        markerlist.add(Marker(
          markerId: MarkerId(markerIds[lat]),
          draggable: false,
          infoWindow: InfoWindow(
            title: name + ' hosted by ' + host,
            snippet: description,
          ),
          onTap: () {
            print('new marker tapped');
          },
          position: LatLng(lat, lng),
        ));
      }
    } catch (err) {
      print(err.toString());
      return null;
    }

    return markerlist;
  }

  Widget build(BuildContext context) {
    fetchMarkersList();

//    print('all markers');
//    print(allMarkers);

    return Scaffold(
        body: Stack(children: [
      Container(
        height: 0.85 *
            (MediaQuery.of(context).size.height *
                MediaQuery.of(context).devicePixelRatio),
        width: MediaQuery.of(context).size.width,
        child: GoogleMap(
          initialCameraPosition:
              CameraPosition(target: LatLng(37.4276, -122.16), zoom: 12.0),
          markers: Set.from(allMarkers),
        ),
      ),
      EventList()
    ]));
  }
}
