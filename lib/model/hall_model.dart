import 'package:cloud_firestore/cloud_firestore.dart';

class HallModel {
  final String hallName;
  final String hallLocation;
  final String reservationPrice;
  final int numberOfSections;
  final int minimumReservationCapacity;
  final int numberOfSeatsMen;
  final int numberOfSeatsWomen;
  final int numberOfFlightAttendantsMen;
  final int numberOfFlightAttendantsWomen;
  final int numberOfEntrances;
  final DateTime selectedDateTime;
  final String selectedTiming;
  final String imageUrl;
  final String token;
  final String hallType;

  HallModel({
    required this.hallName,
    required this.hallLocation,
    required this.reservationPrice,
    required this.numberOfSections,
    required this.minimumReservationCapacity,
    required this.numberOfSeatsMen,
    required this.numberOfSeatsWomen,
    required this.numberOfFlightAttendantsMen,
    required this.numberOfFlightAttendantsWomen,
    required this.numberOfEntrances,
    required this.selectedDateTime,
    required this.selectedTiming,
    required this.imageUrl,
    required this.token,
    required this.hallType,

  });
  factory HallModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return HallModel(
      hallName: data['hallName']?.toString() ?? '',
      hallLocation: data['hallLocation']?.toString() ?? '',
      reservationPrice: data['reservationPrice']?.toString() ?? '',
      numberOfSections: data['numberOfSections'] is int
          ? data['numberOfSections']
          : int.tryParse(data['numberOfSections']?.toString() ?? '0') ?? 0,
      minimumReservationCapacity: data['minimumReservationCapacity'] is int
          ? data['minimumReservationCapacity']
          : int.tryParse(data['minimumReservationCapacity']?.toString() ?? '0') ?? 0,
      numberOfSeatsMen: data['numberOfSeatsMen'] is int
          ? data['numberOfSeatsMen']
          : int.tryParse(data['numberOfSeatsMen']?.toString() ?? '0') ?? 0,
      numberOfSeatsWomen: data['numberOfSeatsWomen'] is int
          ? data['numberOfSeatsWomen']
          : int.tryParse(data['numberOfSeatsWomen']?.toString() ?? '0') ?? 0,
      numberOfFlightAttendantsMen: data['numberOfFlightAttendantsMen'] is int
          ? data['numberOfFlightAttendantsMen']
          : int.tryParse(data['numberOfFlightAttendantsMen']?.toString() ?? '0') ?? 0,
      numberOfFlightAttendantsWomen: data['numberOfFlightAttendantsWomen'] is int
          ? data['numberOfFlightAttendantsWomen']
          : int.tryParse(data['numberOfFlightAttendantsWomen']?.toString() ?? '0') ?? 0,
      numberOfEntrances: data['numberOfEntrances'] is int
          ? data['numberOfEntrances']
          : int.tryParse(data['numberOfEntrances']?.toString() ?? '0') ?? 0,
      selectedDateTime: data['selectedDateTime'] != null
          ? DateTime.parse(data['selectedDateTime'])
          : DateTime.now(),
      selectedTiming: data['selectedTiming']?.toString() ?? '',
      imageUrl: data['imageUrl']?.toString() ?? '',
      token: data['token']?.toString() ?? '',
      hallType: data['hallType']?.toString() ?? '',
    );
  }
}
