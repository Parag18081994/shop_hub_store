import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';

class AuthController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //select img from gallery
  pickProfileImage(ImageSource source) async {
    final ImagePicker _imagePicker = ImagePicker();

    XFile? _file = await _imagePicker.pickImage(source: source);
    if (_file != null) {
      return await _file.readAsBytes();
    } else {
      print('No Image selected');
    }
  }

  Future<String> createNewUser(
      String email, String fullName, String password) async {
    String res = "something went wrong";
    try {
      //we want to create the user first in the authenticationt tab and later in firestore
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      await _firestore.collection("buyers").doc(userCredential.user!.uid).set({
        'fullName': fullName,
        'email': email,
        'buyerId': userCredential.user!.uid,
      });
      res = 'success';
    } catch (e) {
      res = e.toString();
    }

    return res;
  }
}
