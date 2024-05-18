import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

import '../model/descriptionhall_mode.dart';


class HallsViewModel extends ChangeNotifier {
  final DatabaseReference _databaseReference = FirebaseDatabase.instance.ref().child('halls');
  List<HallModel> _halls = [];
  List<HallModel> get halls => _halls;

  HallsViewModel() {
    _fetchHalls();
  }

  void _fetchHalls() {
    _databaseReference.onValue.listen((event) {
      if (event.snapshot.value != null) {
        Map<dynamic, dynamic> data = event.snapshot.value as Map<dynamic, dynamic>;
        final List<HallModel> loadedHalls = [];
        data.forEach((key, value) {
          if (value is Map<String, dynamic>) {
            final hall = HallModel.fromMap(value);
            loadedHalls.add(hall);
          } else {
            print('Data for key $key is not in the expected format.');
          }
        });
        _halls = loadedHalls;
        notifyListeners();
      }
    });
  }
}