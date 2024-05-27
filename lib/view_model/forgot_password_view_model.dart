import 'package:flutter/material.dart';
import '../model/forgot_password_model.dart';
import 'email_model.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Center(
        child: Text('This is the second page!'),
      ),
    );
  }
}

void submitEmail(BuildContext context) {
  var _emailModel;
  if (_emailModel.email.isNotEmpty) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SecondPage()),
    );
  }
}

