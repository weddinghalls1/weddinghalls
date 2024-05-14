import 'package:flutter/material.dart';
import '../view_model/description2.dart';


void main() {
  runApp(DescriptionHall());
}

class DescriptionHall extends StatelessWidget {
  final HallViewModel _viewModel = HallViewModel(); // Create an instance of the ViewModel

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Combined Pages',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: Scaffold(
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
                      itemCount: _viewModel.photoUrls.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Image.network(
                            _viewModel.photoUrls[index],
                            width: 150, // Adjust the width as needed
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 20.0),
                  // Output labels for entered details using ViewModel
                  _buildValueBox('Hall Name:', _viewModel.hallName),
                  SizedBox(height: 10.0),
                  _buildValueBox('Hall Location:', _viewModel.hallLocation),
                  SizedBox(height: 10.0),
                  _buildValueBox('Reservation Price:', _viewModel.reservationPrice),
                  SizedBox(height: 10.0),
                  _buildValueBox('Number of Sections:', _viewModel.numberOfSections.toString()),
                  SizedBox(height: 10.0),
                  _buildValueBox('Minimum Reservation Capacity:', _viewModel.minimumReservationCapacity.toString()),
                  SizedBox(height: 10.0),
                  _buildValueBox('Number of Seats for Men:', _viewModel.numberOfSeatsMen.toString()),
                  SizedBox(height: 10.0),
                  _buildValueBox('Number of Seats for Women:', _viewModel.numberOfSeatsWomen.toString()),
                  SizedBox(height: 10.0),
                  _buildValueBox('Number of Flight Attendants (Men):', _viewModel.numberOfFlightAttendantsMen.toString()),
                  SizedBox(height: 10.0),
                  _buildValueBox('Number of Flight Attendants (Women):', _viewModel.numberOfFlightAttendantsWomen.toString()),
                  SizedBox(height: 10.0),
                  _buildValueBox('Number of Entrances (Doors):', _viewModel.numberOfEntrances.toString()),
                  SizedBox(height: 20.0),
                  // Add other UI elements here
                ],
              ),
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
