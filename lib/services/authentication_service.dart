import 'package:firebase_auth/firebase_auth.dart';
import 'package:revolution/models/a_user.dart';

class AuthenticationService {
  final _auth = FirebaseAuth.instance;

  AUser? _userFromFirebase(User? user) {
    return user != null ? AUser(userID: user.uid) : null;
  }

  Future signIn(String email, String password) async {
    try {
      final User? resultUser = (await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      ))
          .user;
      return _userFromFirebase(resultUser);
    } catch (e) {
      print("=====>$e");
    }
  }

  Future signUp(String email, String password) async {
    try {
      final User? resultUser = (await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      ))
          .user;
      return _userFromFirebase(resultUser);
    } catch (e) {
      print("=====>$e");
    }
  }

  Future resetPsswrd(String email) async {
    try {
      return _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      print(e.toString());
    }
  }

  Future signOUT() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e);
    }
  }
}
