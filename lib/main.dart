import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:weddinghalls/views/SelectPage.dart';
import 'package:weddinghalls/views/admin_description_view.dart';
import 'package:weddinghalls/views/combined_view.dart';
import 'package:weddinghalls/views/profile_screen.dart';

import 'package:weddinghalls/views/onboarding_view.dart';
import 'firebase_options.dart';
import 'package:weddinghalls/views/home_screen.dart';
import 'package:flutter/services.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(const MainPage());
  });
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hall Description',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),





      home: OnboardingView(),
      //HomePage(),


    );
}}

