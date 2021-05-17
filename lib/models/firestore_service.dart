import 'package:circles/models/circles.dart';
import 'package:circles/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final CollectionReference _usersCollectionReference =
      FirebaseFirestore.instance.collection("users");

  final CollectionReference _circlesCollectionReference =
      FirebaseFirestore.instance.collection("circles");

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
      throw '';
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
}
