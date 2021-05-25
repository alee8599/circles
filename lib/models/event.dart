import 'dart:convert';

import 'package:circles/models/firestore_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//maJSk2C1XSeyEKVmGBMIEni7hy23 - alex
//HcsTCw3H0NgeZORzme4FZXTGYB53 - nandita

List<String> filler = [
  'HcsTCw3H0NgeZORzme4FZXTGYB53',
  'maJSk2C1XSeyEKVmGBMIEni7hy23'
];

class Event {
  String id;
  String name;
  double latitude;
  double longitude;
  String host;
  DateTime dateTime; //include after set up the json reading
  String description;
  List<String> invited;
  List<String> going;
  List<String> rejected;

  Event(
      {this.id,
      this.name,
      this.latitude,
      this.longitude,
      this.host,
      this.description,
      this.dateTime,
      this.invited,
      this.going,
      this.rejected});

  static Event createEvent(Map<String, dynamic> json) {
    String id = !json.containsKey('id')
        ? FirestoreService.getRandomString(20)
        : json['id'].toString();
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
    List<String> invited =
        !json.containsKey('invited') ? filler : json['invited'].cast<String>();
    List<String> going =
        !json.containsKey('going') ? [] : json['going'].cast<String>();
    List<String> rejected =
        !json.containsKey('rejected') ? [] : json['rejected'].cast<String>();

    return Event(
        id: id,
        name: name,
        latitude: latitude,
        longitude: longitude,
        host: host,
        dateTime: dateTime,
        description: description,
        invited: invited,
        going: going,
        rejected: rejected);
  }

  Map<String, Object> toJson() {
    return {
      'id': id,
      'name': name,
      'latitude': latitude,
      'longitude': longitude,
      'host': host,
      'dateTime': dateTime.toString(),
      'description': description,
      'invited': invited,
      'going': going,
      'rejected': rejected,
    };
  }

  String toString() {
    return '$id + $name + $latitude + $longitude + $host + ${dateTime.toString()} + $description + $invited + $going + $rejected';
  }
}
