import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:weddinghalls/model/hall_model.dart';

class AddHallViewModel {
  final DatabaseReference _database = FirebaseDatabase.instance.reference();
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<void> saveHallData(HallModel hallModel, File? imageFile) async {
    String token = 'hassan';
    try {
      String imageUrl = '';
      if (imageFile != null) {
        String imagePath = 'halls/${DateTime.now().millisecondsSinceEpoch}_${hallModel.hallName}';

        TaskSnapshot snapshot = await _storage.ref(imagePath).putFile(imageFile);

        imageUrl = await snapshot.ref.getDownloadURL();
      }

      await _database.child('halls').push().set({
        'hallName': hallModel.hallName,
        'hallLocation': hallModel.hallLocation,
        'reservationPrice': hallModel.reservationPrice,
        'numberOfSections': hallModel.numberOfSections,
        'minimumReservationCapacity': hallModel.minimumReservationCapacity,
        'numberOfSeatsMen': hallModel.numberOfSeatsMen,
        'numberOfSeatsWomen': hallModel.numberOfSeatsWomen,
        'numberOfFlightAttendantsMen': hallModel.numberOfFlightAttendantsMen,
        'numberOfFlightAttendantsWomen': hallModel.numberOfFlightAttendantsWomen,
        'numberOfEntrances': hallModel.numberOfEntrances,
        'selectedDateTime': hallModel.selectedDateTime.toIso8601String(),
        'imageUrl': imageUrl,
        'token': token,
      });
    } catch (e) {
      print('Error saving hall data: $e');
      throw e;
    }
  }
}
