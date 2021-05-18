import 'package:circles/models/auth_service.dart';
import 'package:circles/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:circles/components/event_list.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:math';
import 'login.dart';
import 'package:circles/screens/create_event.dart';
import 'package:circles/components/drawer.dart';

class Events extends StatefulWidget {
  bool public;

  Events({this.public});

  @override
  _EventsState createState() => _EventsState();
}

final auth = FirebaseAuth.instance;

class _EventsState extends State<Events> with SingleTickerProviderStateMixin {
  bool top = false;

  @override
  List<Marker> allMarkers = [];
  Map<double, String> markerIds = {};

  AnimationController _animationController;
  bool icon = true;

  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    //  DocumentSnapshot variable = await Firestore.instance.('events');
    fetchMarkersList();
  }

  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  _toggleAnimation() {
    _animationController.isDismissed
        ? _animationController.forward()
        : _animationController.reverse();
  }

  fetchMarkersList() async {
    dynamic list = await getMarkersList();
    if (list == null) {
      print("unable to retrieve marker list");
    } else {
      if (mounted) {
        setState(() {
          allMarkers = list;
        });
      }
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

    final rightSlide = MediaQuery.of(context).size.width * 0.6;

    return SafeArea(
      child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            double slide = rightSlide * _animationController.value;

            return Stack(children: [
              DrawerMenu(),
              eventsStack(slide, widget.public, context)
            ]);
          }),
    );
  }

  Transform eventsStack(double slide, bool public, BuildContext context) {
    return Transform(
        transform: Matrix4.identity()..translate(slide),
        alignment: Alignment.center,
        child: Stack(
          children: [
            Container(
              height: 0.85 *
                  (MediaQuery.of(context).size.height *
                      MediaQuery.of(context).devicePixelRatio),
              width: MediaQuery.of(context).size.width,
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                    target: LatLng(37.4276, -122.16), zoom: 12.0),
                markers: Set.from(allMarkers),
              ),
            ),
            EventList(
                public: public,
                top: (bool input) => {
                      setState(() {
                        top = input;
                      })
                    }),
            Header(context),
          ],
        ));
  }

  AnimatedCrossFade Header(BuildContext context) {
    return AnimatedCrossFade(
      duration: const Duration(milliseconds: 150),
      firstChild: Container(
          color: Colors.white,
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
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => CreateEvent()),
                    );
                  },
                  child: Icon(Icons.add, color: Colors.white),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Yellow)),
                )
              ])),
      secondChild: Container(
          padding: EdgeInsets.only(top: 10.0, left: 15.0, right: 15.0),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    _toggleAnimation();
                    if (mounted) {
                      setState(() {
                        icon = !icon;
                      });
                    }
                  },
                  child: Container(
                      padding: EdgeInsets.only(top: 7.0),
                      child: icon
                          ? SvgPicture.asset(
                              'lib/assets/SVGs/Menu SVG.svg',
                              color: Theme.of(context).primaryColor,
                              semanticsLabel: 'Menu Icon',
                            )
                          : Icon(Icons.close_rounded,
                              size: 50.0,
                              color: Theme.of(context).primaryColor)),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CreateEvent()),
                    );
                  },
                  child: Icon(Icons.add, color: Colors.white),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Yellow)),
                )
              ])),
      crossFadeState:
          top ? CrossFadeState.showFirst : CrossFadeState.showSecond,
    );
  }
}
