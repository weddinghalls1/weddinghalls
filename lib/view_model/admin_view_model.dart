import 'package:firebase_database/firebase_database.dart';

class AdminViewModel {
  final DatabaseReference _database = FirebaseDatabase.instance.reference();

  String? hallName;
  String? hallLocation;
  String? imageUrl;
  String? minimumReservationCapacity;
  String? numberOfEntrances;
  String? numberOfFlightAttendantsMen;
  String? numberOfFlightAttendantsWomen;
  String? numberOfSeatsMen;
  String? numberOfSeatsWomen;
  String? numberOfSections;
  String? reservationPrice;
  String? selectedDateTime;
  String? selectedTiming;

  Future<void> fetchHallData(String token) async {
    try{
      DatabaseEvent event = await _database.child('halls')
          .orderByChild('token')
          .equalTo(token)
          .once();
      DataSnapshot snapshot = event.snapshot;
      if (snapshot.value != null) {
        var entry = (snapshot.value as Map).values
            .first;
        if (entry != null) {
          Map<String, dynamic> hallData = Map<String, dynamic>.from(entry);
          hallName = hallData['hallName'];
          hallLocation = hallData['hallLocation'];
          imageUrl = hallData['imageUrl'];
          minimumReservationCapacity = hallData['minimumReservationCapacity'];
          numberOfEntrances = hallData['numberOfEntrances'];
          numberOfFlightAttendantsMen = hallData['numberOfFlightAttendantsMen'];
          numberOfFlightAttendantsWomen = hallData['numberOfFlightAttendantsWomen'];
          numberOfSeatsMen = hallData['numberOfSeatsMen'];
          numberOfSeatsWomen = hallData['numberOfSeatsWomen'];
          numberOfSections = hallData['numberOfSections'];
          reservationPrice = hallData['reservationPrice'];
          selectedDateTime = hallData['selectedDateTime'];
          selectedTiming = hallData['selectedTiming'];
        }
      } else {
        print('No user found with token: $token');
      }
    }catch (e) {
      print('Error fetching user data: $e');
      throw e;
    }
  }




}