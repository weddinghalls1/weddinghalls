class HallModel {
  final String hallName;
  final String hallLocation;
  final int reservationPrice;
  final int numberOfSections;
  final int minimumReservationCapacity;
  final int numberOfSeatsMen;
  final int numberOfSeatsWomen;
  final int numberOfFlightAttendantsMen;
  final int numberOfFlightAttendantsWomen;
  final int numberOfEntrances;
  final DateTime selectedDateTime;
  late final String selectedTiming;
  final String imageUrl;
  final String token;

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
  });

  factory HallModel.fromMap(Map<String, dynamic> data) {
    return HallModel(
      hallName: data['hallName'] ?? '',
      hallLocation: data['hallLocation'] ?? '',
      reservationPrice: data['reservationPrice'] ?? 0,
      numberOfSections: data['numberOfSections'] ?? 0,
      minimumReservationCapacity: data['minimumReservationCapacity'] ?? 0,
      numberOfSeatsMen: data['numberOfSeatsMen'] ?? 0,
      numberOfSeatsWomen: data['numberOfSeatsWomen'] ?? 0,
      numberOfFlightAttendantsMen: data['numberOfFlightAttendantsMen'] ?? 0,
      numberOfFlightAttendantsWomen: data['numberOfFlightAttendantsWomen'] ?? 0,
      numberOfEntrances: data['numberOfEntrances'] ?? 0,
      selectedDateTime: data['selectedDateTime'] != null ? DateTime.parse(data['selectedDateTime']) : DateTime.now(),
      selectedTiming: data['selectedTiming'] ?? '',
      imageUrl: data['imageUrl'] ?? '',
      token: data['token'] ?? '',
    );
  }
}