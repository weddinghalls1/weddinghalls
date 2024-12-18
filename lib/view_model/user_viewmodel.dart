import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/user_model.dart';

class UserViewModel {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<UserModel?> getUserData() async {
    try {
      DocumentSnapshot doc =
      await _firestore.collection('users').doc('VD1DD62SdwNY2dcFweccfiIe4N53').get();
      if (doc.exists) {
        return UserModel.fromMap(doc.data() as Map<String, dynamic>);
      } else {
        print("Document does not exist");
      }
    } catch (e) {
      print("Error getting user data: $e");
    }
    return null;
  }
}