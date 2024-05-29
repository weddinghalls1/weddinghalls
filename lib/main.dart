import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:weddinghalls/routes/router.dart';
import 'package:weddinghalls/views/SelectPage.dart';
import 'package:weddinghalls/views/checkout_views.dart';
import 'package:weddinghalls/views/reservation.dart';
import 'package:weddinghalls/views/edit_Description_view.dart';
import 'package:weddinghalls/views/detailsReservation_view.dart';
import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainPage());
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
        home:CheckoutPage(),
        );


  }
}
