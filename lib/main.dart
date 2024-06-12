import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weddinghalls/views/My_halls.dart';
import 'package:weddinghalls/views/addNewCard_view.dart';
import 'package:weddinghalls/views/checkout_views.dart';
import 'package:weddinghalls/views/detailsReservation_view.dart';
import 'package:weddinghalls/views/edit_Description_view.dart';
import 'package:weddinghalls/views/reservation.dart';
import 'package:weddinghalls/views/select_page.dart';
import 'package:weddinghalls/views/admin_description_view.dart';
import 'package:weddinghalls/views/admin_halls.dart';
import 'package:weddinghalls/views/combined_view.dart';
import 'package:weddinghalls/views/descriptionHalls.dart';
import 'package:weddinghalls/views/home_switch.dart';
import 'package:weddinghalls/views/profile_screen.dart';

import 'package:weddinghalls/views/onboarding_view.dart';
import 'package:weddinghalls/views/settings_screen.dart';
import 'package:weddinghalls/views/sidbar.dart';
import 'package:weddinghalls/views/signin_page.dart';
import 'component/navbar.dart';
import 'firebase_options.dart';
import 'package:weddinghalls/views/home_screen.dart';
import 'package:flutter/services.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );


  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();


      await prefs.setString('userType', 'user');
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





     // home:HomeNavigationBar(),
      home:OnboardingView(),
      //home:CheckoutPage(),


      //HomePage(),


    );
}}

