import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

//maJSk2C1XSeyEKVmGBMIEni7hy23 - alex
//HcsTCw3H0NgeZORzme4FZXTGYB53 - nandita

List<String> filler = [
  'HcsTCw3H0NgeZORzme4FZXTGYB53',
  'maJSk2C1XSeyEKVmGBMIEni7hy23'
];

class Event {
  String name;
  double latitude;
  double longitude;
  String host;
  DateTime dateTime; //include after set up the json reading
  String description;
  List<String> users;

  Event(
      {this.name,
      this.latitude,
      this.longitude,
      this.host,
      this.description,
      this.dateTime,
      this.users});

  static Event createEvent(Map<String, dynamic> json) {
    String name =
        !json.containsKey('name') ? 'Missing Event' : json['name'].toString();
    double latitude =
        !json.containsKey('latitude') ? 39.0 : json['latitude'].toDouble();
    double longitude =
        !json.containsKey('longitude') ? -124.0 : json['longitude'].toDouble();
    String host =
        !json.containsKey('host') ? 'Missing Host' : json['host'].toString();
    DateTime dateTime = !json.containsKey('dateTime')
        ? DateTime.now()
        : DateTime.parse(json['dateTime'].toString());
    String description = !json.containsKey('description')
        ? 'Missing Description'
        : json['description'].toString();
    List<String> users =
        !json.containsKey('users') ? filler : json['users'].cast<String>();

    return Event(
        name: name,
        latitude: latitude,
        longitude: longitude,
        host: host,
        dateTime: dateTime,
        description: description,
        users: users);
  }

  Map<String, Object> toJson() {
    return {
      'name': name,
      'latitude': latitude,
      'longitude': longitude,
      'host': host,
      'dateTime': dateTime.toString(),
      'description': description,
      'users': users
    };
  }

  String toString() {
    return '$name + $latitude + $longitude + $host + ${dateTime.toString()} + $description';
  }
}
