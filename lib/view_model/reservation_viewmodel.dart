import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/reservation_model.dart';

class ReservationViewModel {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> saveHallData(HallModel hallModel) async {
    try {
      await _firestore.collection('reservation').add(hallModel.toMap());
    } catch (e) {
      print('Error saving hall data: $e');
      throw e;
    }
  }
}