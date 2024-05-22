class HallModel {

  final int capacity;
  final int numberOfSeatsMen;
  final int numberOfSeatsWomen;
  final int numberOfFlightAttendantsMen;
  final int numberOfFlightAttendantsWomen;
  final int numberOfEntrances;
  final DateTime selectedDateTime;
  final String selectedTiming;
final String token;
  HallModel( {

    required this.capacity,
    required this.numberOfSeatsMen,
    required this.numberOfSeatsWomen,
    required this.numberOfFlightAttendantsMen,
    required this.numberOfFlightAttendantsWomen,
    required this.numberOfEntrances,
    required this.selectedDateTime,
    required this.selectedTiming,
    required this.token,
  }) {
    // TODO: implement HallModel
    throw UnimplementedError();
  }

  factory HallModel.fromMap(Map<String, dynamic> map) {
    return HallModel(
      capacity: map['capacity'],
      numberOfSeatsMen: map['numberOfSeatsMen'],
      numberOfSeatsWomen: map['numberOfSeatsWomen'],
      numberOfFlightAttendantsMen: map['numberOfFlightAttendantsMen'],
      numberOfFlightAttendantsWomen: map['numberOfFlightAttendantsWomen'],
      numberOfEntrances: map['numberOfEntrances'],
      selectedDateTime: DateTime.parse(map['selectedDateTime']),
      selectedTiming: map['selectedTiming'],
      token: map['token'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'capacity': capacity,
      'numberOfSeatsMen': numberOfSeatsMen,
      'numberOfSeatsWomen': numberOfSeatsWomen,
      'numberOfFlightAttendantsMen': numberOfFlightAttendantsMen,
      'numberOfFlightAttendantsWomen': numberOfFlightAttendantsWomen,
      'numberOfEntrances': numberOfEntrances,
      'selectedDateTime': selectedDateTime.toIso8601String(),
      'selectedTiming': selectedTiming,
      'token':token,
    };
  }
}
