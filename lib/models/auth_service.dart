import 'package:circles/models/firestore_service.dart';
import 'package:circles/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  CirclesUser _currentUser;
  CirclesUser get currentUser => _currentUser;

  Future populateCurrentUser(String uid) async {
    FirestoreService _firestoreService = new FirestoreService();

    print('uid in populate current user');
    print(uid);

    if (uid != null) {
      try {
        _currentUser = await _firestoreService.getUser(uid);
      } catch (e) {
        print(e);
      }
    }
  }
}
