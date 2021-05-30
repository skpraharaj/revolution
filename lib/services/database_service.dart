import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  Future<QuerySnapshot<Map<String, dynamic>>> getUserByUsername(
      String username) {
    return FirebaseFirestore.instance
        .collection("User")
        .where("userName", isEqualTo: username)
        .get();
  }

  uploadUserInfo(userMap) {
    FirebaseFirestore.instance.collection("User").add(userMap);
  }
}
