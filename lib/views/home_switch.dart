import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:weddinghalls/views/auth_screen.dart';
import 'package:weddinghalls/views/home_page.dart';

import 'home_screen.dart';
class HomeSwitch extends StatelessWidget {
  const HomeSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (builder, snapshot) {
          if(snapshot.hasData){
            return HomeScreen();
          }else{
            return AuthScreen();
          }
        }
      ),
    );
  }
}
