import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/home_model.dart';

class HomeViewModel extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<HomeHallModel> halls = [];

  Future<void> fetchData() async {
    try {
      QuerySnapshot snapshot = await _firestore.collection('home_hall').get();
      if (snapshot.docs.isNotEmpty) {
        halls.clear();
        for (var doc in snapshot.docs) {
          HomeHallModel hall = HomeHallModel(
            title: doc['title'] as String,
            imageUrl: doc['imageUrl'] as String,
            details: doc['details'] as String,
          );
          halls.add(hall);
        }
        notifyListeners();
      } else {
        print('No data found for halls.');
      }
    } catch (e) {
      print('Error fetching halls data: $e');
    }
  }
}
