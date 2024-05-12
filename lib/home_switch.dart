import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:weddinghalls/screen/Authentication/Signin.dart';
import 'package:weddinghalls/screen/home/home_page.dart';
class HomeSwitch extends StatelessWidget {
  const HomeSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (builder, snapshot) {
          if(snapshot.hasData){
            return HomePage();
          }else{
            return SigninPage();
          }
        }
      ),
    );
  }
}
