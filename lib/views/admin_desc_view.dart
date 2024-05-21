import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../view_model/admin_view_model.dart';

class ViewHallDescription extends StatefulWidget {
  const ViewHallDescription({Key? key}) : super(key: key);

  @override
  State<ViewHallDescription> createState() => _ViewHallDescription();
}

class _ViewHallDescription extends State<ViewHallDescription> {
  final AdminViewModel viewModel = AdminViewModel();

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

  @override
  void initState() {
    super.initState();
    String initialToken = 'hassan';
    viewModel.fetchHallData(initialToken).then((_) {
      if (mounted) {
        setState(() {
          hallNameController.text = viewModel.hallName ?? '';
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
          selectedTimingController.text = viewModel.selectedTiming ?? '';
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFE6E6),
      appBar: AppBar(
        title: const Text(
          'Hall Description',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                width: 400,
                height: 180,
                margin: EdgeInsets.only(top: 10),
                child: Column(
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.only(right: 290),
                      child: Text(
                        'Hall Name',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    TextField(
                      controller: hallNameController,
                      decoration: const InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                      ),
                      readOnly: true,
                    ),
                    SizedBox(height: 15),
                    const Padding(
                      padding: EdgeInsets.only(right: 260),
                      child: Text(
                        'Hall Location',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    TextField(
                      controller: hallLocationController,
                      decoration: const InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                      ),
                      readOnly: true,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8),
              Padding(
                padding: EdgeInsets.only(top: 5),
                child: Container(
                  height: 220,
                  width: 400,
                  color: Colors.white,
                  child: Image.network(
                    viewModel.imageUrl ?? '',
                    width: 300,
                    height: 200,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(
                        Icons.image_not_supported,
                        size: 200,
                        color: Colors.grey,
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: 8),
              Container(
                height: 720,
                width: 400,
                child: Column(
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.only(right: 230),
                      child: Text(
                        'Reservation Price',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    TextField(
                      controller: reservationPriceController,
                      decoration: const InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                      ),
                      readOnly: true,
                    ),
                    SizedBox(height: 15),
                    const Padding(
                      padding: EdgeInsets.only(right: 210),
                      child: Text(
                        'Number of Sections',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    TextField(
                      controller: numberOfSectionsController,
                      decoration: const InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                      ),
                      readOnly: true,
                    ),
                    SizedBox(height: 15),
                    const Padding(
                      padding: EdgeInsets.only(right: 110),
                      child: Text(
                        'Minimum Reservation Capacity',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    TextField(
                      controller: minimumReservationCapacityController,
                      decoration: const InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                      ),
                      readOnly: true,
                    ),
                    SizedBox(height: 15),
                    const Padding(
                      padding: EdgeInsets.only(right: 160),
                      child: Text(
                        'Number of Seats for Men',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    TextField(
                      controller: numberOfSeatsMenController,
                      decoration: const InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                      ),
                      readOnly: true,
                    ),
                    SizedBox(height: 15),
                    const Padding(
                      padding: EdgeInsets.only(right: 135),
                      child: Text(
                        'Number of Seats for Women',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    TextField(
                      controller: numberOfSeatsWomenController,
                      decoration: const InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                      ),
                      readOnly: true,
                    ),
                    SizedBox(height: 15),
                    const Padding(
                      padding: EdgeInsets.only(right: 80),
                      child: Text(
                        'Number of Flight Attendants (Men)',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    TextField(
                      controller: numberOfFlightAttendantsMenController,
                      decoration: const InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                      ),
                      readOnly: true,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 50),
                      child: Text(
                        'Number of Flight Attendants (Women)',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    TextField(
                      controller: numberOfFlightAttendantsWomenController,
                      decoration: const InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                      ),
                      readOnly: true,
                    ),
                    SizedBox(height: 15),
                    const Padding(
                      padding: EdgeInsets.only(right: 140),
                      child: Text(
                        'Number of Entrances (Door)',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    TextField(
                      controller: numberOfEntrancesController,
                      decoration: const InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                      ),
                      readOnly: true,
                    ),
                  ],
                ),
              ),

                      ElevatedButton(
                        onPressed: () {
// Add to favorites functionality
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFA62C3A),
                        ),
                        child: Text('Rejection', style: TextStyle(color: Colors.black)),
                      ),
                      ElevatedButton(
                        onPressed: () {
// Reservation functionality
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF618E5A),
                        ),
                        child: Text('Acceptance', style: TextStyle(color: Colors.black)),
                      ),
                    ],
                  ),
                ),
              ),
    );
  }
}