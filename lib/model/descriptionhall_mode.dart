import 'package:cloud_firestore/cloud_firestore.dart';

class DescriptionModel {
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
  final List<String> photoUrls;

  DescriptionModel({
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
    required this.photoUrls,
  });

  factory DescriptionModel.fromMap(Map<String, dynamic> data) {
    return DescriptionModel(
      hallName: data['hallName'] ?? '',
      hallLocation: data['hallLocation'] ?? '',
      reservationPrice: data['reservationPrice'] ?? '',
      numberOfSections: data['numberOfSections'] ?? 0,
      minimumReservationCapacity: data['minimumReservationCapacity'] ?? 0,
      numberOfSeatsMen: data['numberOfSeatsMen'] ?? 0,
      numberOfSeatsWomen: data['numberOfSeatsWomen'] ?? 0,
      numberOfFlightAttendantsMen: data['numberOfFlightAttendantsMen'] ?? 0,
      numberOfFlightAttendantsWomen: data['numberOfFlightAttendantsWomen'] ?? 0,
      numberOfEntrances: data['numberOfEntrances'] ?? 0,
      photoUrls: List<String>.from(data['photoUrls'] ?? []),
    );
  }
}