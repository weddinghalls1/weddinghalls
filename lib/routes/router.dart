import 'package:weddinghalls/component/navbar.dart';
import 'package:weddinghalls/views/combined_view.dart';
import 'package:weddinghalls/views/home_screen.dart';
import 'package:weddinghalls/views/profile_screen.dart';

import '../views/empty_home.dart';
import '../views/reservation.dart';
import '../views/sidbar.dart';



var kRoutes = {

  '/homepage':(context)=>HomeScreen(),
  '/':(context)=>HomeNavigationBar(),
  '/profile':(context)=>ProfileScreen(),
  '/add-hall':(context)=>CombinedPage(),
  '/ReservationPage':(context)=>ReservationPage(),
  '/HomePage':(context)=>HomePage(),

};

