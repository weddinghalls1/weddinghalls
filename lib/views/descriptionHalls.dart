import 'package:flutter/material.dart';
import '../view_model/description2.dart';

class DescriptionHall extends StatefulWidget {
  @override
  _DescriptionHallState createState() => _DescriptionHallState();
}

class _DescriptionHallState extends State<DescriptionHall> {
  final HallViewModel _viewModel = HallViewModel();

  @override
  void initState() {
    super.initState();
    _viewModel.fetchHallData('hallId'); // Replace 'hallId' with actual ID
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hall Details'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hall Name: ${_viewModel.hallData.name}',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              ' hall Location: ${_viewModel.hallData.location}',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Hall reservation price: ${_viewModel.hallData.reservationPrice}',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Number of Sections: ${_viewModel.hallData.numberOfSections}',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Minimum Reservation Capacity: ${_viewModel.hallData.minimumReservationCapacity}',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Number of Seats for Men: ${_viewModel.hallData.numberOfSeatsMen}',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Number of Seats for Women: ${_viewModel.hallData.numberOfSeatsWomen}',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Number of Flight Attendants (Men): ${_viewModel.hallData.numberOfFlightAttendantsMen}',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Number of Flight Attendants (Women): ${_viewModel.hallData.numberOfFlightAttendantsWomen}',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Number of Entrances (Doors): ${_viewModel.hallData.numberOfEntrances}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20.0),

          ],
        ),
      ),
    );
  }
}
