import 'package:flutter/material.dart';
import 'package:weddinghalls/screen/hall/hall_view.dart';
import 'package:weddinghalls/screen/home/home_screen.dart';
import 'package:weddinghalls/screen/projfile/profile_view.dart';


class HomeNavigationBar extends StatefulWidget {
  const HomeNavigationBar({Key? key}) : super(key: key);

  @override
  State<HomeNavigationBar> createState() => _HomeNavigationBarState();
}

class _HomeNavigationBarState extends State<HomeNavigationBar> {
  final screen = [HomeScreen(), HallScreen(), ProfileScreen()];
  int _selectedScreenIndex = 0;

  void _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
        child: Scaffold(
          body: screen[_selectedScreenIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedScreenIndex,
            unselectedItemColor: Colors.black,
            selectedItemColor: Colors.red,
            onTap: _selectScreen,
            backgroundColor: Colors.white,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.business),
                label: 'Halls',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}