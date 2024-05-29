import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:weddinghalls/routes/router.dart';
import 'package:weddinghalls/views/SelectPage.dart';
import 'package:weddinghalls/views/addNewCard_view.dart';
import 'package:weddinghalls/views/empty_home.dart';
import 'package:weddinghalls/views/reservation.dart';
import 'package:weddinghalls/views/edit_Description_view.dart';
import 'package:weddinghalls/views/detailsReservation_view.dart';
import 'package:weddinghalls/views/sidbar.dart';
import 'firebase_options.dart';
import 'package:weddinghalls/views/onboarding_view.dart';
import 'package:weddinghalls/view_model/onboarding_viewmodel.dart';
import 'package:flutter/services.dart';
import 'firebase_options.dart';
import 'views/home_switch.dart';


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
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AddCardPayment(),
    );


      return MaterialApp(

        debugShowCheckedModeBanner: false,
        home:HomePage(),
        );




  }
}