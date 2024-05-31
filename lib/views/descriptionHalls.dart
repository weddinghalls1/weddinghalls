import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/descriptionhall_mode.dart';
import '../view_model/description_viewmodel.dart';

class DescriptionHalls extends StatefulWidget {
  @override
  _DescriptionHallsState createState() => _DescriptionHallsState();
}

class _DescriptionHallsState extends State<DescriptionHalls> {
  final DescriptionViewModel _viewModel = DescriptionViewModel();
  DescriptionModel? _description;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    try {
      DescriptionModel description = await _viewModel.fetchDescription();
      setState(() {
        _description = description;
      });
    } catch (e) {
      print("Error fetching data: $e");
    }
  }

  Widget _buildValueBox(String label, String value) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF7469B6),
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5.0),
          Text(
            value,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _selectDateTime(BuildContext context) async {
    final DateTime? pickedDateTime = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (pickedDateTime != null) {
      setState(() {
        selectedDateTime = pickedDateTime;
      });
    }
  }

  DateTime? selectedDateTime = DateTime.now();
  String? selectedTiming;

  @override
  Widget build(BuildContext context) {
    if (_description == null) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Hall'),
          centerTitle: true,
        ),
        body: Center(child: CircularProgressIndicator()),
      );
    }

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
                // Horizontal Scrolling List of Photos
                Container(
                  height: 150, // Adjust the height as needed
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _description!.photoUrls.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Image.network(
                          _description!.photoUrls[index],
                          width: 150, // Adjust the width as needed
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 20.0),
                // Output labels for entered details
                _buildValueBox('Hall Name:', _description!.hallName),
                SizedBox(height: 10.0),
                _buildValueBox('Hall Location:', _description!.hallLocation),
                SizedBox(height: 10.0),
                _buildValueBox('Reservation Price:', _description!.reservationPrice),
                SizedBox(height: 10.0),
                _buildValueBox('Number of Sections:', _description!.numberOfSections.toString()),
                SizedBox(height: 10.0),
                _buildValueBox('Minimum Reservation Capacity:', _description!.minimumReservationCapacity.toString()),
                SizedBox(height: 10.0),
                _buildValueBox('Number of Seats for Men:', _description!.numberOfSeatsMen.toString()),
                SizedBox(height: 10.0),
                _buildValueBox('Number of Seats for Women:', _description!.numberOfSeatsWomen.toString()),
                SizedBox(height: 10.0),
                _buildValueBox('Number of Flight Attendants (Men):', _description!.numberOfFlightAttendantsMen.toString()),
                SizedBox(height: 10.0),
                _buildValueBox('Number of Flight Attendants (Women):', _description!.numberOfFlightAttendantsWomen.toString()),
                SizedBox(height: 10.0),
                _buildValueBox('Number of Entrances (Doors):', _description!.numberOfEntrances.toString()),
                SizedBox(height: 20.0),
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
                  title: Text('Timing 1'),
                  value: selectedTiming == 'Timing 1',
                  onChanged: (value) {
                    setState(() {
                      if (value == true) {
                        selectedTiming = 'Timing 1';
                      }
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Timing 2'),
                  value: selectedTiming == 'Timing 2',
                  onChanged: (value) {
                    setState(() {
                      if (value == true) {
                        selectedTiming = 'Timing 2';
                      }
                    });
                  },
                ),
                SizedBox(height: 20.0),
                // Reservation Confirmation Button
                ElevatedButton(
                  onPressed: () {
                    if (selectedDateTime != null && selectedTiming != null) {
                      // Show success message
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Reservation successful!'),
                          backgroundColor: Colors.green,
                        ),
                      );
                    } else {
                      // Show failure message
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Failed: Please select date and timing.'),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF7469B6), // Purplish-blue background color
                  ),
                  child: Text(
                    'Reservation Confirmation',
                    style: TextStyle(color: Colors.white), // White text color
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}