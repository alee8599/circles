import 'package:circles/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final CollectionReference _usersCollectionReference =
      FirebaseFirestore.instance.collection("users");

  Future createUser(CirclesUser user) async {
    try {
      print(user.id);

      await _usersCollectionReference.doc(user.id).set(user.toJson());
    } catch (e) {
      throw '';
    }
  }

  Future getUser(String uid) async {
    try {
      var userData = await _usersCollectionReference.doc(uid).get();
//      print('data');
      //     print(userData);

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
