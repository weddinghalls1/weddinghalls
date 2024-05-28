import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../views/forgot_password_view.dart';

class EmailModel {
  String email;

  EmailModel({required this.email});
}

class EmailViewModel {
  EmailModel _emailModel = EmailModel(email: '');

  String get email => _emailModel.email;

  void setEmail(String email) {
    _emailModel.email = email;
  }

  Future<void> submitEmail(BuildContext context) async {
    if (_emailModel.email.isNotEmpty) {
      try {
        await FirebaseAuth.instance.sendPasswordResetEmail(email: _emailModel.email);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SecondPage()),
        );
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Password reset email sent')),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: ${e.toString()}')),
        );
      }
    }
  }
}
