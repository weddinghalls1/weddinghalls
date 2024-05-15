

import 'package:weddinghalls/component/navbar.dart';

import 'package:weddinghalls/screen/home/home_screen.dart';
import 'package:weddinghalls/screen/projfile/profile_view.dart';


import 'package:weddinghalls/screen/home/home_view.dart';
import 'package:weddinghalls/screen/projfile/profile_screeen.dart';

import 'package:weddinghalls/views/combined_view.dart';
import 'package:weddinghalls/views/home_screen.dart';
import 'package:weddinghalls/views/profile_screeen.dart';



var kRoutes = {

  '/homepage':(context)=>HomeScreen(),
  '/':(context)=>HomeNavigationBar(),
  '/profile':(context)=>ProfileScreen(),
  '/add-hall':(context)=>CombinedPage(),

};