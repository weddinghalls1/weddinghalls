import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../view_model/forgot_password_view_model.dart';

class EmailVerificationPage extends StatelessWidget {
  final EmailViewModel emailViewModel = EmailViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFE6E6),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 50),
                Image.asset('images/Forgot password.png'),
                SizedBox(height: 25),
                Text(
                  'Please enter your email address to receive a verification card.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 20),
                TextField(
                  onChanged: (value) => emailViewModel.setEmail(value),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter your email ...',
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => emailViewModel.submitEmail(context),
                  child: Text(
                    'Send',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF7469B6),
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  ),
                ),
                SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
