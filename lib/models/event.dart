import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Event {
  final String name;
  final double latitude;
  final double longitude;
  final String host;
  //final DateTime dateTime; include after set up the json reading
  final String description;
  //final List<String> participants;

  Event(
      {this.name, this.latitude, this.longitude, this.host, this.description});

  Event.fromData(QueryDocumentSnapshot<Object> data)
      : this(
          name: data.get('name').toString(),
          latitude: data.get('latitude').toDouble(),
          longitude: data.get('longitude').toDouble(),
          host: data.get('host').toString(),
          description: data.get('description').toString(),
        );

  Map<String, Object> toJson() {
    return {
      'name': name,
      'latitude': latitude,
      'longitude': longitude,
      'host': host,
      'description': description
    };
  }

  String toString() {
    return '$name + $latitude + $longitude + $host + $description';
  }
}
