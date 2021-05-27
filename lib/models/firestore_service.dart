import 'package:circles/models/circles.dart';
import 'package:circles/models/user_model.dart';
import 'package:circles/models/event.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';
import 'dart:convert';

class FirestoreService {
  final CollectionReference _chatsCollectionReference =
      FirebaseFirestore.instance.collection("chats");

  final CollectionReference _usersCollectionReference =
      FirebaseFirestore.instance.collection("users");

  final CollectionReference _circlesCollectionReference =
      FirebaseFirestore.instance.collection("circles");

  final CollectionReference _eventsCollectionReference =
      FirebaseFirestore.instance.collection("events");

  static const _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';

  static String getRandomString(int length) {
    Random _rnd = Random();
    return String.fromCharCodes(Iterable.generate(
        length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
  }

  Future createUser(CirclesUser user) async {
    try {
      print(user.id);

      await _usersCollectionReference.doc(user.id).set(user.toJson());
    } catch (e) {
      throw '';
    }
  }

  Future createCircles(Circles circle) async {
    try {
      await _circlesCollectionReference.doc(circle.id).set(circle.toJson());
    } catch (e) {
      throw e;
    }
  }

  static Future addUsertoCircle(Circles circle, String uid) async {
    circle.userIds.add(uid);
    circle.userIds = circle.userIds.toSet().toList();
    return await FirebaseFirestore.instance
        .collection('circles')
        .doc(circle.id)
        .update({'userIds': circle.userIds})
        .then((value) => print("User invited"))
        .catchError((error) => print("Failed to invite user: $error"));
  }

  Future retrieveAllCircles(String uid) async {
    try {
      var circles = await _circlesCollectionReference.get();
      List<Circles> circlesWithUid;

      final circlesData =
          List.from(circles.docs.map((doc) => doc.data())).toList();

      print("circles data");
      print(circlesData);

      for (int i = 0; i < circlesData.length; ++i) {
        for (int j = 0; j < circlesData[i]["userIDs"].length; ++j) {
          if (circlesData[i]["userIDs"][j] == uid) {
            circlesWithUid.add(circlesData[i]["userIDs"]);
            continue;
          }
        }
      }

      return circlesWithUid;
    } catch (e) {
      throw e;
    }
  }

  Future getUserIdFromName(String name) async {
    try {
      var users = await _usersCollectionReference.get();
      final userData = List.from(users.docs.map((doc) => doc.data())).toList();

      for (int i = 0; i < userData.length; ++i) {
        if (userData[i]["name"] == name) {
          return userData[i]["id"];
        }
      }
    } catch (e) {
      throw e;
    }
  }

  Future getUser(String uid) async {
    try {
      var userData = await _usersCollectionReference.doc(uid).get();

      CirclesUser user = new CirclesUser(
          id: userData['id'],
          name: userData['name'],
          email: userData['email'],
          imageUrl: userData['imageUrl']);

      print(user);
      return user;
    } catch (e) {
      print(e);
    }
  }

  static Future addUsertoList(
      String uid, Event currentEvent, String listType) async {
    switch (listType) {
      case "invited":
        {
          print(currentEvent.id);
          currentEvent.invited.add(uid);
          currentEvent.invited = currentEvent.invited.toSet().toList();
          print(currentEvent.invited);
          return await FirebaseFirestore.instance
              .collection('events')
              .doc(currentEvent.id)
              .update({'invited': currentEvent.invited})
              .then((value) => print("User invited"))
              .catchError((error) => print("Failed to invite user: $error"));
        }
        break;

      case "going":
        {
          currentEvent.going.add(uid);
          currentEvent.going = currentEvent.going.toSet().toList();
          return await FirebaseFirestore.instance
              .collection('events')
              .doc(currentEvent.id)
              .update({'going': currentEvent.going})
              .then((value) => print("User added to going list"))
              .catchError((error) => print("Failed to add user: $error"));
        }
        break;

      case "rejected":
        {
          currentEvent.rejected.add(uid);
          currentEvent.rejected = currentEvent.rejected.toSet().toList();
          return await FirebaseFirestore.instance
              .collection('events')
              .doc(currentEvent.id)
              .update({'rejected': currentEvent.rejected})
              .then((value) => print("User added to rejected list"))
              .catchError((error) => print("Failed to add user: $error"));
        }
        break;
    }
  }

  static Future removeUser(
      String uid, Event currentEvent, String listType) async {
    switch (listType) {
      case "invited":
        {
          currentEvent.invited.remove(uid);
          return await FirebaseFirestore.instance
              .collection('events')
              .doc(currentEvent.id)
              .update({'invited': currentEvent.invited})
              .then((value) => print("User removed from invite list"))
              .catchError((error) => print("Failed to remove user: $error"));
        }
        break;

      case "going":
        {
          currentEvent.going.remove(uid);
          return await FirebaseFirestore.instance
              .collection('events')
              .doc(currentEvent.id)
              .update({'going': currentEvent.going})
              .then((value) => print("User removed from going list"))
              .catchError((error) => print("Failed to remove user: $error"));
        }
        break;

      case "rejected":
        {
          currentEvent.rejected.remove(uid);
          return await FirebaseFirestore.instance
              .collection('events')
              .doc(currentEvent.id)
              .update({'rejected': currentEvent.rejected})
              .then((value) => print("User removed rejected list"))
              .catchError((error) => print("Failed to remove user: $error"));
        }
        break;
    }
  }

  static Future addEvent(Event newEvent) async {
    return await FirebaseFirestore.instance
        .collection('events')
        .add(newEvent.toJson())
        .then((value) => print('Event added'))
        .catchError((error) => print("failed to add event"));
  }

  static Future removeEvent(Event currentEvent) async {
    return await FirebaseFirestore.instance
        .collection('events')
        .doc(currentEvent.id)
        .delete()
        .then((value) => print('Event added'))
        .catchError((error) => print("failed to add event"));
  }
}
