
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../model/signin_model.dart';  // Ensure this import points to the new model file

class SigninViewModel {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> login(String email, String password) async {
    AppUser user = AppUser(email: email, password: password);  // Use the new AppUser class
    try {
      await _auth.signInWithEmailAndPassword(email: user.email, password: user.password);
    } catch (e) {
      // Handle Errors here
    }
  }
}
