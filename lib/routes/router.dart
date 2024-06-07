



import 'package:weddinghalls/views/descriptionHalls.dart';
import 'package:weddinghalls/views/home_screen.dart';
import 'package:weddinghalls/views/profile_screen.dart';
import 'package:weddinghalls/component/navbar.dart';
import 'package:weddinghalls/views/combined_view.dart';
import 'package:weddinghalls/views/home_screen.dart';
import 'package:weddinghalls/views/profile_screen.dart';

import '../views/checkout_views.dart';
import '../views/empty_home.dart';
import '../views/reservation.dart';
import '../views/sidbar.dart';






var kRoutes = {

  '/homepage':(context)=>HomeScreen(),
  '/':(context)=>HomeNavigationBar(),
  '/profile':(context)=>ProfileScreen(category: '',),
  '/add-hall':(context)=>CombinedPage(),
  '/ReservationPage':(context)=>ReservationPage(),
'/CheckoutPage ':(context)=>CheckoutPage(),
  '/HomePage':(context)=>HomePage(),
  '/descriptionHalls':(context)=>DescriptionHalls(),
};

