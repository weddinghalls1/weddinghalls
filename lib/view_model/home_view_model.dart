import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import '../model/home_model.dart';

class HomeViewModel extends ChangeNotifier {
  final DatabaseReference _database = FirebaseDatabase.instance.reference();
  List<HomeHallModel> halls = [];

  Future<void> fetchData() async {
    try {
      DataSnapshot snapshot = await _database.child('home_hall').get();
      if (snapshot.exists) {
        Map<String, dynamic> hallsData = Map<String, dynamic>.from(
            snapshot.value as Map<dynamic, dynamic>);
        halls.clear();
        hallsData.forEach((key, value) {
          HomeHallModel hall = HomeHallModel(
            title: value['title'] as String,
            imageUrl: value['imageUrl'] as String,
            details: value['details'] as String,
          );
          halls.add(hall);
        });
        notifyListeners();
      } else {
        print('No data found for halls.');
      }
    } catch (e) {
      print('Error fetching halls data: $e');
    }
  }
}
