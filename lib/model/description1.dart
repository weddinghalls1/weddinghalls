class Hall {
  String name;
  String location;
  String reservationPrice;
  int numberOfSections;
  int minimumReservationCapacity;
  int numberOfSeatsMen;
  int numberOfSeatsWomen;
  int numberOfFlightAttendantsMen;
  int numberOfFlightAttendantsWomen;
  int numberOfEntrances;

  Hall({
    required this.name,
    required this.location,
    required this.reservationPrice,
    required this.numberOfSections,
    required this.minimumReservationCapacity,
    required this.numberOfSeatsMen,
    required this.numberOfSeatsWomen,
    required this.numberOfFlightAttendantsMen,
    required this.numberOfFlightAttendantsWomen,
    required this.numberOfEntrances,
  });
}
