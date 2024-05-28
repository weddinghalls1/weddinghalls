import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weddinghalls/views/admin_description_view.dart';
import 'package:weddinghalls/views/combined_view.dart';
import 'package:weddinghalls/views/forgot_password_view.dart';
import 'package:weddinghalls/views/home_screen.dart';
import 'package:weddinghalls/views/profile_screen.dart';
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
      title: 'Edit Hall Description',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: EmailVerificationPage(),
    );
  }
}
