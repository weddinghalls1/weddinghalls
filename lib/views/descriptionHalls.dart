import 'package:flutter/material.dart';

void main() {
  runApp(DescriptionHall());
}

class DescriptionHall extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Combined Pages',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: CombinedPage(),
    );
  }
}

class CombinedPage extends StatefulWidget {
  @override
  _CombinedPageState createState() => _CombinedPageState();
}

class _CombinedPageState extends State<CombinedPage> {
  final List<String> photoUrls = [
    '',
    '',
    '',
    // Add more photo URLs as needed
  ];

  String hallName = '';
  String hallLocation = '';
  String reservationPrice = '';
  int numberOfSections = 0;
  int minimumReservationCapacity = 0;
  int numberOfSeatsMen = 0;
  int numberOfSeatsWomen = 0;
  int numberOfFlightAttendantsMen = 0;
  int numberOfFlightAttendantsWomen = 0;
  int numberOfEntrances = 0;

  DateTime? selectedDateTime = DateTime.now();
  String? selectedTiming;

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
                // Horizontal Scrolling List of Photos
                Container(
                  height: 150, // Adjust the height as needed
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: photoUrls.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Image.network(
                          photoUrls[index],
                          width: 150, // Adjust the width as needed
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 20.0),
                // Output labels for entered details
                _buildValueBox('Hall Name:', hallName),
                SizedBox(height: 10.0),
                _buildValueBox('Hall Location:', hallLocation),
                SizedBox(height: 10.0),
                _buildValueBox('Reservation Price:', reservationPrice),
                SizedBox(height: 10.0),
                _buildValueBox(
                    'Number of Sections:', numberOfSections.toString()),
                SizedBox(height: 10.0),
                _buildValueBox('Minimum Reservation Capacity:',
                    minimumReservationCapacity.toString()),
                SizedBox(height: 10.0),
                _buildValueBox(
                    'Number of Seats for Men:', numberOfSeatsMen.toString()),
                SizedBox(height: 10.0),
                _buildValueBox('Number of Seats for Women:',
                    numberOfSeatsWomen.toString()),
                SizedBox(height: 10.0),
                _buildValueBox('Number of Flight Attendants (Men):',
                    numberOfFlightAttendantsMen.toString()),
                SizedBox(height: 10.0),
                _buildValueBox('Number of Flight Attendants (Women):',
                    numberOfFlightAttendantsWomen.toString()),
                SizedBox(height: 10.0),
                _buildValueBox('Number of Entrances (Doors):',
                    numberOfEntrances.toString()),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Add to favorites functionality
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF7469B6), // Background color
                      ),
                      child: Text('Add to Favorites',
                          style: TextStyle(color: Colors.white)),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Reservation functionality
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF7469B6), // Background color
                      ),
                      child: Text('Reservation',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
