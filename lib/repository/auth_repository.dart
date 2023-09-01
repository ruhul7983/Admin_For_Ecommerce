import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_admin/model/UserModel.dart';

class AuthRepository {
  Stream<List<UserModel>> fetchUsers() {
    return FirebaseFirestore.instance
        .collection("users")
        .snapshots()
        .map((querySnapshot) {
      return querySnapshot.docs.map((docSnapshot) {
        final data = docSnapshot.data();
        return UserModel.fromJson(data);
      }).toList();
    });
  }
}
