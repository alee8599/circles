import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Event {
  String name;
  double latitude;
  double longitude;
  String host;
  DateTime dateTime; //include after set up the json reading
  String description;
  //final List<String> participants;

  Event(
      {this.name,
      this.latitude,
      this.longitude,
      this.host,
      this.description,
      this.dateTime});

  Event.fromData(QueryDocumentSnapshot<Object> data)
      : this(
          name: data.get('name').toString(),
          latitude: data.get('latitude').toDouble(),
          longitude: data.get('longitude').toDouble(),
          host: data.get('host').toString(),
          dateTime: DateTime.parse(data.get('dateTime').toString()),
          description: data.get('description').toString(),
        );

  Map<String, Object> toJson() {
    return {
      'name': name,
      'latitude': latitude,
      'longitude': longitude,
      'host': host,
      'dateTime': dateTime.toString(),
      'description': description,
    };
  }

  String toString() {
    return '$name + $latitude + $longitude + $host + ${dateTime.toString()} + $description';
  }
}
