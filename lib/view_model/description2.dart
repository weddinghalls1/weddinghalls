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

  void updateReservationPrice(String price) {
    _hall.reservationPrice = price;
  }

  void updateNumberOfSections(int sections) {
    _hall.numberOfSections = sections;
  }

  void updateMinimumReservationCapacity(int capacity) {
    _hall.minimumReservationCapacity = capacity;
  }

  void updateNumberOfSeatsMen(int seats) {
    _hall.numberOfSeatsMen = seats;
  }

  void updateNumberOfSeatsWomen(int seats) {
    _hall.numberOfSeatsWomen = seats;
  }

  void updateNumberOfFlightAttendantsMen(int attendants) {
    _hall.numberOfFlightAttendantsMen = attendants;
  }

  void updateNumberOfFlightAttendantsWomen(int attendants) {
    _hall.numberOfFlightAttendantsWomen = attendants;
  }

  void updateNumberOfEntrances(int entrances) {
    _hall.numberOfEntrances = entrances;
  }

}
