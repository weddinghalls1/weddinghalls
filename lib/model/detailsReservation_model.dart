class DataRes {

  final String hallLocation;
  final String hallName;
  final String imageUrl;
  final String minimumReservationCapacity;
  final String numberOfEntrances;
  final String numberOfFlightAttendantsMen;
  final String numberOfFlightAttendantsWomen;
  final String numberOfSeatsMen;
  final String numberOfSeatsWomen;
  final String numberOfSections;
  final String reservationPrice;
  final String selectedDateTime;
  final String selectedTiming;

  DataRes({

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

  });
  factory DataRes.fromMap(Map<String, dynamic> map) {
    return DataRes(
      hallName: map['hallName'].toString(),
      hallLocation: map['hallLocation'].toString(),
      imageUrl: map['imageUrl'].toString(),
      minimumReservationCapacity: map['minimumReservationCapacity'].toString(),
      numberOfEntrances: map['numberOfEntrances'].toString(),
      numberOfFlightAttendantsMen: map['numberOfFlightAttendantsMen'].toString(),
      numberOfFlightAttendantsWomen: map['numberOfFlightAttendantsWomen'].toString(),
      numberOfSeatsMen: map['numberOfSeatsMen'].toString(),
      numberOfSeatsWomen: map['numberOfSeatsWomen'].toString(),
      numberOfSections: map['numberOfSections'].toString(),
      reservationPrice: map['reservationPrice'].toString(),
      selectedDateTime: map['selectedDateTime'].toString(),
      selectedTiming: map['selectedTiming'].toString(),
    );
  }

}
