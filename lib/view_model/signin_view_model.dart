import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import '../component/navbar.dart';
import '../model/signin_model.dart';
import '../views/home_screen.dart';

class SigninViewModel {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> login(String email, String password, String selectedCategory, BuildContext context) async {
    AppUser user = AppUser(email: email, password: password);
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );

      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .get();

      if (userDoc.exists) {
        String category = userDoc['category'];
        if (category == selectedCategory) {
          print('User category matches: $category');
          QuickAlert.show(context: context, type: QuickAlertType.success);
          Navigator.pushReplacement( context, MaterialPageRoute(builder: (context) => HomeNavigationBar()), );
        } else {
          await _auth.signOut();
          QuickAlert.show(
              context: context,
              type: QuickAlertType.error,
              title: 'Error',
              text: 'Selected category does not match the stored category');
        }
      } else {
        QuickAlert.show(
            context: context,
            type: QuickAlertType.error,
            title: 'Error',
            text: 'User document does not exist');
      }
    } catch (e) {
      QuickAlert.show(context: context, type: QuickAlertType.error, text: e.toString());
    }
  }
}
