import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weddinghalls/model/hall_model_data.dart';
import 'package:weddinghalls/view_model/get_halls_view_model.dart';

import '../model/descriptionhall_mode.dart';
import '../view_model/description_viewmodel.dart';

class DescriptionHalls extends StatefulWidget {
  final HallModel? hallModel; // Make hallModel nullable

  DescriptionHalls({this.hallModel}); // Constructor with named parameter

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
        color: const Color(0xFF7469B6),
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5.0),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_description == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Hall'),
          centerTitle: true,
        ),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Hall'),
        centerTitle: true,
      ),
      body: Container(
        color: const Color(0xFFF8BBD0), // Pastel pink background color
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Horizontal Scrolling List of Photos
                SizedBox(
                  height: 150, // Adjust the height as needed
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _description!.photoUrls.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.network(
                          _description!.photoUrls[index],
                          width: 150, // Adjust the width as needed
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20.0),
                // Output labels for entered details
                _buildValueBox('Hall Name:', _description!.hallName),
                const SizedBox(height: 10.0),
                _buildValueBox('Hall Location:', _description!.hallLocation),
                const SizedBox(height: 10.0),
                _buildValueBox('Reservation Price:', _description!.reservationPrice),
                const SizedBox(height: 10.0),
                _buildValueBox('Number of Sections:', _description!.numberOfSections.toString()),
                const SizedBox(height: 10.0),
                _buildValueBox('Minimum Reservation Capacity:', _description!.minimumReservationCapacity.toString()),
                const SizedBox(height: 10.0),
                _buildValueBox('Number of Seats for Men:', _description!.numberOfSeatsMen.toString()),
                const SizedBox(height: 10.0),
                _buildValueBox('Number of Seats for Women:', _description!.numberOfSeatsWomen.toString()),
                const SizedBox(height: 10.0),
                _buildValueBox('Number of Flight Attendants (Men):', _description!.numberOfFlightAttendantsMen.toString()),
                const SizedBox(height: 10.0),
                _buildValueBox('Number of Flight Attendants (Women):', _description!.numberOfFlightAttendantsWomen.toString()),
                const SizedBox(height: 10.0),
                _buildValueBox('Number of Entrances (Doors):', _description!.numberOfEntrances.toString()),
                const SizedBox(height: 20.0),
                // Add to Favorites Button
                ElevatedButton(
                  onPressed: () {
                    HallsViewModel hallsViewModel = HallsViewModel();
                    hallsViewModel.addFavoriteHall(widget.hallModel!, "12345");
                    // Implement the logic to add the hall to favorites
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Added to favorites!'),
                        backgroundColor: Colors.blue,
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF7469B6), // Purplish-blue background color
                  ),
                  child: const Text(
                    'Add to Favorites',
                    style: TextStyle(color: Colors.white), // White text color
                  ),
                ),
                const SizedBox(height: 10.0),
                // Reservation Confirmation Button
                ElevatedButton(
                  onPressed: () {

                    // Show success message
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Reservation successful!'),
                        backgroundColor: Colors.green,
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF7469B6), // Purplish-blue background color
                  ),
                  child: const Text(
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