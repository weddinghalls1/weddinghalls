import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home !"),
        backgroundColor: Colors.purpleAccent,
        actions: [
          IconButton(
            onPressed: (){
              FirebaseAuth.instance.signOut();
            }, icon: Icon(Icons.logout),
          )
        ],
      ),
    );
  }
}