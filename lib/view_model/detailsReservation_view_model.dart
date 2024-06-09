import 'package:cloud_firestore/cloud_firestore.dart';


class DetailsReservation {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

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

  Future<void> fetchResData(String token) async {
    try {
      QuerySnapshot querySnapshot = await _firestore
          .collection('halls')
          .where('token', isEqualTo: token)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        var hallData = querySnapshot.docs.first.data() as Map<String, dynamic>;

        hallName = hallData['hallName'].toString();
        hallLocation = hallData['hallLocation'].toString();
        imageUrl = hallData['imageUrl'].toString();
        minimumReservationCapacity = hallData['minimumReservationCapacity'].toString();
        numberOfEntrances = hallData['numberOfEntrances'].toString();
        numberOfFlightAttendantsMen = hallData['numberOfFlightAttendantsMen'].toString();
        numberOfFlightAttendantsWomen = hallData['numberOfFlightAttendantsWomen'].toString();
        numberOfSeatsMen = hallData['numberOfSeatsMen'].toString();
        numberOfSeatsWomen = hallData['numberOfSeatsWomen'].toString();
        numberOfSections = hallData['numberOfSections'].toString();
        reservationPrice = hallData['reservationPrice'].toString();
        selectedDateTime = hallData['selectedDateTime'].toString();
        selectedTiming = hallData['selectedTiming'].toString();

        print('Data fetched successfully');
        print('Hall Name: $hallName');
        print('Hall Location: $hallLocation');
      } else {
        print('No hall found with token: $token');
      }
    } catch (e) {
      print('Error fetching hall data: $e');
      throw e;
    }
  }
}