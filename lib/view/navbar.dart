import 'package:flutter/material.dart';
import 'package:weddinghalls/screen/hall/hall_screen.dart';
import 'package:weddinghalls/screen/home/home_screen.dart';
// import 'package:untitled/screen/projfile/profile_screen.dart';
// import 'package:untitled/screen/favorite/favorite_screen.dart';
// import 'package:untitled/screen/sidebar/sidebar_screen.dart';

class HomeNavigationBar extends StatefulWidget {
  const HomeNavigationBar({Key? key}) : super(key: key);

  @override
  State<HomeNavigationBar> createState() => _HomeNavigationBarState();
}

class _HomeNavigationBarState extends State<HomeNavigationBar> {
  final screen = [HomeScreen(), HallScreen(), /*ProfileScreen()*/];
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
          appBar: AppBar(
            title: const Text('Navigation Bar'),
            /*leading: IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SidebarScreen()));
              },
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.favorite),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => FavoriteScreen()));
                },
              ),
            ],*/
          ),
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

