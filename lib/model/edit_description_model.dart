class HallModel {
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

  HallModel({
    this.hallName,
    this.hallLocation,
    this.imageUrl,
    this.minimumReservationCapacity,
    this.numberOfEntrances,
    this.numberOfFlightAttendantsMen,
    this.numberOfFlightAttendantsWomen,
    this.numberOfSeatsMen,
    this.numberOfSeatsWomen,
    this.numberOfSections,
    this.reservationPrice,

  });

  factory HallModel.fromMap(Map<String, dynamic> data) {
    return HallModel(
      hallName: data['hallName'] as String?,
      hallLocation: data['hallLocation'] as String?,
      imageUrl: data['imageUrl'] as String?,
      minimumReservationCapacity: data['minimumReservationCapacity'] as String?,
      numberOfEntrances: data['numberOfEntrances'] as String?,
      numberOfFlightAttendantsMen: data['numberOfFlightAttendantsMen'] as String?,
      numberOfFlightAttendantsWomen: data['numberOfFlightAttendantsWomen'] as String?,
      numberOfSeatsMen: data['numberOfSeatsMen'] as String?,
      numberOfSeatsWomen: data['numberOfSeatsWomen'] as String?,
      numberOfSections: data['numberOfSections'] as String?,
      reservationPrice: data['reservationPrice'] as String?,

    );
  }

  Map<String, dynamic> toMap() {
    return {
      'hallName': hallName,
      'hallLocation': hallLocation,
      'imageUrl': imageUrl,
      'minimumReservationCapacity': minimumReservationCapacity,
      'numberOfEntrances': numberOfEntrances,
      'numberOfFlightAttendantsMen': numberOfFlightAttendantsMen,
      'numberOfFlightAttendantsWomen': numberOfFlightAttendantsWomen,
      'numberOfSeatsMen': numberOfSeatsMen,
      'numberOfSeatsWomen': numberOfSeatsWomen,
      'numberOfSections': numberOfSections,
      'reservationPrice': reservationPrice,

    };
  }
}
