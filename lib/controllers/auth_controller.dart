import 'package:firebase_auth/firebase_auth.dart';

class AuthController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<String> createNewUser(
      String email, String fullName, String password) async {
    String res = "something went wrong";
    try {
      //we want to create the user first in the authenticationt tab and later in firestore
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      res = 'success';
    } catch (e) {
      res = e.toString();
    }

    return res;
  }
}
