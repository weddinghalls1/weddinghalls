import '../model/description1.dart';


class HallViewModel {
  Hall _hall = Hall(
    name: '',
    location: '',
    reservationPrice: '',
    numberOfSections: 0,
    minimumReservationCapacity: 0,
    numberOfSeatsMen: 0,
    numberOfSeatsWomen: 0,
    numberOfFlightAttendantsMen: 0,
    numberOfFlightAttendantsWomen: 0,
    numberOfEntrances: 0,
  );

  // Getter methods for accessing hall data
  String get hallName => _hall.name;
  String get hallLocation => _hall.location;
  String get reservationPrice => _hall.reservationPrice;

  get numberOfSeatsWomen => null;

  get numberOfFlightAttendantsMen => null;

  get numberOfEntrances => null;

  get numberOfFlightAttendantsWomen => null;

  get numberOfSeatsMen => null;

  get minimumReservationCapacity => null;

  get numberOfSections => null;

  get photoUrls => null;
  // Add getters for other properties as needed

  // Methods to update hall data
  void updateHallName(String name) {
    _hall.name = name;
  }

  void updateHallLocation(String location) {
    _hall.location = location;
  }

// Add update methods for other properties as needed
}
