
import 'package:flutter/material.dart';
import 'package:weddinghalls/views/sidbar.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sidebar Example'),
      ),
      drawer:Sidebar(),
      body: Center(
        child: Text('Home Page Content'),
      ),
    );
  }
}
