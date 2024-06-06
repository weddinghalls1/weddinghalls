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
}
