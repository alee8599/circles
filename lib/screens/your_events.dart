import 'package:circles/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:circles/components/event_list.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class YourEvents extends StatefulWidget {
  @override
  _YourEventsState createState() => _YourEventsState();
}

class _YourEventsState extends State<YourEvents> {
  @override
  List<Marker> allMarkers = [];

  void initState() {
    super.initState();
    allMarkers.add(Marker(
      markerId: MarkerId('myMarker'),
      draggable: false,
      onTap: () {
        print('marker tapped');
      },
      position: LatLng(37.4276, -122.16),
    ));
  }

  Widget build(BuildContext context) {
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
