class Admin {
  final String id;
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
  final String hallType; // New property

  Admin({
    required this.id,
    required this.hallLocation,
    required this.hallName,
    required this.imageUrl,
    required this.minimumReservationCapacity,
    required this.numberOfEntrances,
    required this.numberOfFlightAttendantsMen,
    required this.numberOfFlightAttendantsWomen,
    required this.numberOfSeatsMen,
    required this.numberOfSeatsWomen,
    required this.numberOfSections,
    required this.reservationPrice,
    required this.selectedDateTime,
    required this.selectedTiming,
    required this.token,
    required this.hallType, // New property
  });
}
