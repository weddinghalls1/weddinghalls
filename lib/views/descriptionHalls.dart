import 'package:flutter/material.dart';

import '../model/descriptionhall_mode.dart';
import '../view_model/description_viewmodel.dart';

class DescriptionHalls extends StatefulWidget {
  const DescriptionHalls({Key? key}) : super(key: key);
  @override
  _DescriptionHallsState createState() => _DescriptionHallsState();
}

class _DescriptionHallsState extends State<DescriptionHalls> {
  final HallsViewModel viewModel = HallsViewModel();

  final TextEditingController hallNameController = TextEditingController();
  final TextEditingController hallLocationController = TextEditingController();
  final TextEditingController imageUrlController = TextEditingController();
  final TextEditingController minimumReservationCapacityController = TextEditingController();
  final TextEditingController numberOfEntrancesController = TextEditingController();
  final TextEditingController numberOfFlightAttendantsMenController = TextEditingController();
  final TextEditingController numberOfFlightAttendantsWomenController = TextEditingController();
  final TextEditingController numberOfSeatsMenController = TextEditingController();
  final TextEditingController numberOfSeatsWomenController = TextEditingController();
  final TextEditingController numberOfSectionsController = TextEditingController();
  final TextEditingController reservationPriceController = TextEditingController();
  final TextEditingController selectedDateTimeController = TextEditingController();
  final TextEditingController selectedTimingController = TextEditingController();

  DateTime? selectedDateTime;
  String? selectedTiming;
  void initState() {
    super.initState();
    String initialToken = 'hassan';
    viewModel.fetchHallData(initialToken).then((_) {
      if (mounted) {
        setState(() {   hallNameController.text = viewModel.hallName ?? '';
        hallLocationController.text = viewModel.hallLocation ?? '';
        imageUrlController.text = viewModel.imageUrl ?? '';
        minimumReservationCapacityController.text = viewModel.minimumReservationCapacity ?? '';
        numberOfEntrancesController.text = viewModel.numberOfEntrances ?? '';
        numberOfFlightAttendantsMenController.text = viewModel.numberOfFlightAttendantsMen ?? '';
        numberOfFlightAttendantsWomenController.text = viewModel.numberOfFlightAttendantsWomen ?? '';
        numberOfSeatsMenController.text = viewModel.numberOfSeatsMen ?? '';
        numberOfSeatsWomenController.text = viewModel.numberOfSeatsWomen ?? '';
        numberOfSectionsController.text = viewModel.numberOfSections ?? '';
        reservationPriceController.text = viewModel.reservationPrice ?? '';
        selectedDateTime = viewModel.selectedDateTime != null ? DateTime.parse(viewModel.selectedDateTime!) : null;
        selectedTiming = viewModel.selectedTiming ?? '';
        selectedDateTimeController.text = viewModel.selectedDateTime ?? '';
        selectedTimingController.text = viewModel.selectedTiming ?? '';});
      }
    });
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
    List<HallModel> halls = viewModel.halls;

    // Ensure there's at least one hall to display; otherwise, handle it gracefully
    HallModel hall = halls.isNotEmpty
        ? halls[0]
        : HallModel(
      hallName: 'Default Hall Name',
      hallLocation: 'Default Location',
      reservationPrice: 0,
      numberOfSections: 0,
      minimumReservationCapacity: 0,
      numberOfSeatsMen: 0,
      numberOfSeatsWomen: 0,
      numberOfFlightAttendantsMen: 0,
      numberOfFlightAttendantsWomen: 0,
      numberOfEntrances: 0,
      selectedDateTime: DateTime.now(),
      selectedTiming: 'morning',
      imageUrl: 'https://via.placeholder.com/150',
      token: 'defaultToken',
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Hall'),
        centerTitle: true,
      ),
      body: Container(
        color: Color(0xFFF8BBD0), // Pastel pink background color
        child: halls.isEmpty
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
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
                    itemCount: halls.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Image.network(
                          halls[index].imageUrl,
                          width: 150, // Adjust the width as needed
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 20.0),
                // Output labels for entered details
                _buildValueBox('Hall Name:', hall.hallName),
                SizedBox(height: 10.0),
                _buildValueBox('Hall Location:', hall.hallLocation),
                SizedBox(height: 10.0),
                _buildValueBox('Reservation Price:', hall.reservationPrice.toString()),
                SizedBox(height: 10.0),
                _buildValueBox('Number of Sections:', hall.numberOfSections.toString()),
                SizedBox(height: 10.0),
                _buildValueBox('Minimum Reservation Capacity:', hall.minimumReservationCapacity.toString()),
                SizedBox(height: 10.0),
                _buildValueBox('Number of Seats for Men:', hall.numberOfSeatsMen.toString()),
                SizedBox(height: 10.0),
                _buildValueBox('Number of Seats for Women:', hall.numberOfSeatsWomen.toString()),
                SizedBox(height: 10.0),
                _buildValueBox('Number of Flight Attendants (Men):', hall.numberOfFlightAttendantsMen.toString()),
                SizedBox(height: 10.0),
                _buildValueBox('Number of Flight Attendants (Women):', hall.numberOfFlightAttendantsWomen.toString()),
                SizedBox(height: 10.0),
                _buildValueBox('Number of Entrances (Doors):', hall.numberOfEntrances.toString()),
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
                  'Selected Date: ${selectedDateTime?.toString().split(' ')[0]}',
                  style: TextStyle(fontSize: 16.0, color: Colors.black),
                ),
                SizedBox(height: 20.0),
                // Select Timing
                Text('Select Timing:', style: TextStyle(color: Colors.black)),
                CheckboxListTile(
                  title: Text('Morning reservation (9:00 AM - 11:30 AM)'),
                  value: selectedTiming == 'morning',
                  onChanged: (bool? value) {
                    setState(() {
                      if (value == true) {
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
                  onChanged: (bool? value) {
                    setState(() {
                      if (value == true) {
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
                  onChanged: (bool? value) {
                    setState(() {
                      if (value == true) {
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
                      child: Text('Add to Favorites', style: TextStyle(color: Colors.white)),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Reservation functionality
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF7469B6), // Background color
                      ),
                      child: Text('Reservation', style: TextStyle(color: Colors.white)),
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
}
