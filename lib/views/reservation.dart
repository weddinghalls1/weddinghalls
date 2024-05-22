import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/reservation_model.dart';
import '../view_model/reservation_viewmodel.dart';

class ReservationPage extends StatefulWidget {
  @override
  _ReservationPageState createState() => _ReservationPageState();
}

class _ReservationPageState extends State<ReservationPage> {
  final ReservationViewModel _reservationViewModel = ReservationViewModel();


  int capacity = 0;
  int numberOfSeatsMen = 0;
  int numberOfSeatsWomen = 0;
  int numberOfFlightAttendantsMen = 0;
  int numberOfFlightAttendantsWomen = 0;
  int numberOfEntrances = 0;

  DateTime? selectedDateTime = DateTime.now();
  String? selectedTiming;


  Widget _buildInputBox(String label, String value, ValueChanged<String> onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 5.0),
        TextField(
          decoration: InputDecoration(
            hintText: value,
            hintStyle: TextStyle(color: Colors.black),
            border: OutlineInputBorder(),
            fillColor: Colors.white,
            filled: true,
          ),
          keyboardType: TextInputType.number,
          onChanged: onChanged,
        ),
      ],
    );
  }

  Future<void> _selectDateTime(BuildContext context) async {
    final DateTime? pickedDateTime = await showDatePicker(
      context: context,
      initialDate: selectedDateTime ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (pickedDateTime != null) {
      setState(() {
        selectedDateTime = pickedDateTime;
      });
    }
  }
  Future<void> _saveHallData() async {
    try {
      HallModel hallModel = HallModel(
          capacity: capacity,
          numberOfSeatsMen: numberOfSeatsMen,
          numberOfSeatsWomen: numberOfSeatsWomen,
          numberOfFlightAttendantsMen: numberOfFlightAttendantsMen,
          numberOfFlightAttendantsWomen: numberOfFlightAttendantsWomen,
          numberOfEntrances: numberOfEntrances,
          selectedDateTime: selectedDateTime!,
          selectedTiming: selectedTiming!,
          token: ''
      );


      print("Successfully");

    } catch (e) {
      // Show error message
      print("error to save data${e.toString()}");

    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hall'),
        centerTitle: true,
      ),
      body: Container(
        color: Color(0xFFF8BBD0), // Pastel pink background color
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Select Date
                Text('Date:', style: TextStyle(color: Colors.black)),
                SizedBox(height: 10.0),
                ElevatedButton(
                  onPressed: () => _selectDateTime(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF7469B6), // Background color
                  ),
                  child: Text(
                    'Select Date',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  'Selected Date: ${selectedDateTime.toString()}',
                  style: TextStyle(fontSize: 16.0, color: Colors.black),
                ),
                SizedBox(height: 20.0),

                // Select Timing
                Text('Select Timing:', style: TextStyle(color: Colors.black)),
                CheckboxListTile(
                  title: Text('Morning reservation (9:00 AM - 11:30 AM)'),
                  value: selectedTiming == 'morning',
                  onChanged: (value) {
                    setState(() {
                      if (value!) {
                        selectedTiming = 'morning';
                      } else {
                        selectedTiming = null;
                      }
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Evening reservation (2:00 PM - 4:30 PM)'),
                  value: selectedTiming == 'evening',
                  onChanged: (value) {
                    setState(() {
                      if (value!) {
                        selectedTiming = 'evening';
                      } else {
                        selectedTiming = null;
                      }
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Late evening reservation (7:00 PM - 9:30 PM)'),
                  value: selectedTiming == 'late_evening',
                  onChanged: (value) {
                    setState(() {
                      if (value!) {
                        selectedTiming = 'late_evening';
                      } else {
                        selectedTiming = null;
                      }
                    });
                  },
                ),
                SizedBox(height: 20.0),

                // Input data for capacity, number of seats, and flight attendants
                _buildInputBox('Capacity', capacity == 0 ? '' : capacity.toString(), (value) {
                  setState(() {
                    capacity = int.tryParse(value) ?? 0;
                  });
                }),
                SizedBox(height: 10.0),
                _buildInputBox('Number of Seats for Men', numberOfSeatsMen == 0 ? '' : numberOfSeatsMen.toString(), (value) {
                  setState(() {
                    numberOfSeatsMen = int.tryParse(value) ?? 0;
                  });
                }),
                SizedBox(height: 10.0),
                _buildInputBox('Number of Seats for Women', numberOfSeatsWomen == 0 ? '' : numberOfSeatsWomen.toString(), (value) {
                  setState(() {
                    numberOfSeatsWomen = int.tryParse(value) ?? 0;
                  });
                }),
                SizedBox(height: 10.0),
                _buildInputBox('Number of Flight Attendants (Men)', numberOfFlightAttendantsMen == 0 ? '' : numberOfFlightAttendantsMen.toString(), (value) {
                  setState(() {
                    numberOfFlightAttendantsMen = int.tryParse(value) ?? 0;
                  });
                }),
                SizedBox(height: 10.0),
                _buildInputBox('Number of Flight Attendants (Women)', numberOfFlightAttendantsWomen == 0 ? '' : numberOfFlightAttendantsWomen.toString(), (value) {
                  setState(() {
                    numberOfFlightAttendantsWomen = int.tryParse(value) ?? 0;
                  });
                }),
                SizedBox(height: 10.0),

                // Reservation Confirmation Button
                ElevatedButton(
                  onPressed: () async {
                    HallModel hallModel = HallModel(
                      capacity: capacity,
                      numberOfSeatsMen: numberOfSeatsMen,
                      numberOfSeatsWomen: numberOfSeatsWomen,
                      numberOfFlightAttendantsMen: numberOfFlightAttendantsMen,
                      numberOfFlightAttendantsWomen: numberOfFlightAttendantsWomen,
                      numberOfEntrances: numberOfEntrances,
                      selectedDateTime: selectedDateTime!,
                      selectedTiming: selectedTiming!, token: '',
                    );

                    try {
                      await _reservationViewModel.saveHallData(hallModel);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Reservation saved successfully!')),
                      );
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Failed to save reservation.')),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF7469B6), // purplish-blue color
                  ),
                  child: Text('Reservation Confirmation'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
