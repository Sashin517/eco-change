import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});

  // Collection reference
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  Future updateUserData(String email, String password, int coins) async {
    return await userCollection.doc(uid).set({
      'email': email,
      'password': password,
      'createdAt': FieldValue.serverTimestamp(),
      'coins': coins,
    });
  }
}