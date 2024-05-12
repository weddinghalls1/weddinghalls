

import 'package:weddinghalls/component/navbar.dart';
import 'package:weddinghalls/views/home_screen.dart';
import 'package:weddinghalls/views/profile_screeen.dart';

var kRoutes = {

  '/homepage':(context)=>HomeScreen(),
  '/':(context)=>HomeNavigationBar(),
  '/profile':(context)=>ProfileScreen(),
};