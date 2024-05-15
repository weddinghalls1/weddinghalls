import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/description1.dart';

class HallViewModel {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Hall _hall = Hall(
    name: '',
    location: '',
    reservationPrice: '',
    numberOfSections: 0,
    minimumReservationCapacity: 0,
    numberOfSeatsMen: 0,
    numberOfSeatsWomen: 0,
    numberOfFlightAttendantsMen: 0,
    numberOfFlightAttendantsWomen: 0,
    numberOfEntrances: 0,
  );

  Hall get hallData => _hall;

  Future<void> fetchHallData(String hallId) async {
    DocumentSnapshot<Map<String, dynamic>> snapshot =
    await _firestore.collection('halls').doc(hallId).get();
    if (snapshot.exists) {
      _hall = Hall(
        name: snapshot['name'] ?? '',
        location: snapshot['location'] ?? '',
        reservationPrice: snapshot['reservationPrice'] ?? '',
        numberOfSections: snapshot['numberOfSections'] ?? 0,
        minimumReservationCapacity: snapshot['minimumReservationCapacity'] ?? 0,
        numberOfSeatsMen: snapshot['numberOfSeatsMen'] ?? 0,
        numberOfSeatsWomen: snapshot['numberOfSeatsWomen'] ?? 0,
        numberOfFlightAttendantsMen: snapshot['numberOfFlightAttendantsMen'] ?? 0,
        numberOfFlightAttendantsWomen: snapshot['numberOfFlightAttendantsWomen'] ?? 0,
        numberOfEntrances: snapshot['numberOfEntrances'] ?? 0,
      );
    }
  }

  void updateHallName(String name) {
    _hall.name = name;
  }

  void updateHallLocation(String location) {
    _hall.location = location;
  }

// Add update methods for other properties as needed
}
