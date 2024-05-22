
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../model/reservation_model.dart';

class ReservationViewModel {
  final DatabaseReference _database = FirebaseDatabase.instance.reference();
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<void> saveHallData(HallModel hallModel) async {
    String token = 'rahaf';
    try {
      await _database.child('reservation').push().set({

        'capacity': hallModel.capacity,
        'numberOfSeatsMen': hallModel.numberOfSeatsMen,
        'numberOfSeatsWomen': hallModel.numberOfSeatsWomen,
        'numberOfFlightAttendantsMen': hallModel.numberOfFlightAttendantsMen,
        'numberOfFlightAttendantsWomen': hallModel.numberOfFlightAttendantsWomen,
        'numberOfEntrances': hallModel.numberOfEntrances,
        'selectedDateTime': hallModel.selectedDateTime.toIso8601String(),
        'selectedTiming': hallModel.selectedTiming,
        'token': token
      });
    } catch (e) {
      print('Error saving hall data: $e');
      throw e;
    }
  }
}
