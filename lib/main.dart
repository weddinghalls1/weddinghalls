import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:weddinghalls/view_model/description_viewmodel.dart';
import 'package:weddinghalls/views/descriptionHalls.dart';
import 'firebase_options.dart';
import 'routes/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainPage());
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider( // Wrap MainPage with ChangeNotifierProvider
      create: (_) => HallsViewModel(), // Provide HallsViewModel
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DescriptionHalls(),
        routes: kRoutes,
      ),
    );
  }
}