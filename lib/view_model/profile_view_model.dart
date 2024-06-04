import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

class ProfileViewModel {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  String? email;
  String? userName;
  String? location;
  String? profileImageUrl;

  Future<void> fetchUserData(String userId) async {
    try {
      DocumentSnapshot userDoc = await _firestore.collection('user').doc(userId).get();
      if (userDoc.exists) {
        Map<String, dynamic> userData = userDoc.data() as Map<String, dynamic>;
        email = userData['email'];
        userName = userData['userName'];
        location = userData['location'];
        profileImageUrl = userData['profileImageUrl'];
      } else {
        print('No user found with userId: $userId');
      }
    } catch (e) {
      print('Error fetching user data: $e');
      throw e;
    }
  }

  Future<void> updateUserData(String userId, String userName, String location) async {
    try {
      await _firestore.collection('user').doc(userId).update({
        'userName': userName,
        'location': location,
      });
      this.userName = userName;
      this.location = location;
    } catch (e) {
      print('Error updating user data: $e');
      throw e;
    }
  }

  Future<void> uploadProfileImage(String userId, File imageFile) async {
    try {
      Reference storageRef = _storage.ref().child('profile_images/$userId.jpg');
      UploadTask uploadTask = storageRef.putFile(imageFile);

      TaskSnapshot taskSnapshot = await uploadTask;
      String downloadUrl = await taskSnapshot.ref.getDownloadURL();

      await _firestore.collection('users').doc(userId).update({
        'profileImageUrl': downloadUrl,
      });

      profileImageUrl = downloadUrl;
    } catch (e) {
      print('Error uploading profile image: $e');
      throw e;
    }
  }

  Future<void> deleteUserData(String userId) async {
    try {
      await _firestore.collection('users').doc(userId).delete();
      Reference storageRef = _storage.ref().child('profile_images/$userId.jpg');
      await storageRef.delete();
    } catch (e) {
      print('Error deleting user data: $e');
      throw e;
    }
  }
}
