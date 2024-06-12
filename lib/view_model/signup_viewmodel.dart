import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../component/navbar.dart';
import '../model/signup_model.dart';
import 'package:flutter/material.dart';

import '../views/empty_home.dart';

class SignupViewModel {
  final StreamController<bool> _loadingController = StreamController<bool>();
  final StreamController<String?> _errorController = StreamController<String?>();
  Stream<bool> get loadingStream => _loadingController.stream;
  Stream<String?> get errorStream => _errorController.stream;

  void dispose() {
    _loadingController.close();
    _errorController.close();
  }

  void clearError() {
    _errorController.add(null);
  }

  bool isPasswordConfirmed(String password, String confirmPassword) {
    return password.trim() == confirmPassword.trim();
  }

  bool isEmailValid(String email) {
    String emailPattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    RegExp regExp = RegExp(emailPattern);
    return regExp.hasMatch(email);
  }

  bool isCategorySelected(String category) {
    return category.isNotEmpty;
  }

  bool areFieldsFilled(UserModel user, String password, String confirmPassword) {
    return user.fullName.isNotEmpty &&
        user.phone.isNotEmpty &&
        user.email.isNotEmpty &&
        password.isNotEmpty &&
        confirmPassword.isNotEmpty;
  }

  Future<void> signup(UserModel user, String password, String confirmPassword, BuildContext context) async {
    if (!areFieldsFilled(user, password, confirmPassword)) {
      _errorController.add('Please fill in all fields!');
      return;
    }

    if (!isCategorySelected(user.category)) {
      _errorController.add('Please select a category!');
      return;
    }

    if (!isEmailValid(user.email)) {
      _errorController.add('Please enter a valid email address!');
      return;
    }

    if (!isPasswordConfirmed(password, confirmPassword)) {
      _errorController.add('Passwords do not match!');
      return;
    }

    _loadingController.add(true);
    _errorController.add(null);

    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: user.email,
        password: password,
      );

      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .set(user.toMap());

      _loadingController.add(false);

      Navigator.pushReplacement( context, MaterialPageRoute(builder: (context) => HomeNavigationBar()), );

    } catch (e) {
      _loadingController.add(false);
      _errorController.add(e.toString());
    }
  }
}
