import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:weddinghalls/model/hall_model.dart';
import 'package:weddinghalls/view_model/add_hall_viewmodel.dart';

class CombinedPage extends StatefulWidget {
  @override
  _CombinedPageState createState() => _CombinedPageState();
}

class _CombinedPageState extends State<CombinedPage> {
  final AddHallViewModel _addhallViewModel = AddHallViewModel();

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
  String hallType = 'Open';

  File? _image;

  final TextEditingController _hallNameController = TextEditingController();
  final TextEditingController _hallLocationController = TextEditingController();
  final TextEditingController _reservationPriceController = TextEditingController();
  final TextEditingController _numberOfSectionsController = TextEditingController();
  final TextEditingController _minimumReservationCapacityController = TextEditingController();
  final TextEditingController _numberOfSeatsMenController = TextEditingController();
  final TextEditingController _numberOfSeatsWomenController = TextEditingController();
  final TextEditingController _numberOfFlightAttendantsMenController = TextEditingController();
  final TextEditingController _numberOfFlightAttendantsWomenController = TextEditingController();
  final TextEditingController _numberOfEntrancesController = TextEditingController();

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Future<void> _saveHallData() async {
    try {
      HallModel hallModel = HallModel(
        hallName: hallName,
        hallLocation: hallLocation,
        reservationPrice: reservationPrice,
        numberOfSections: numberOfSections,
        minimumReservationCapacity: minimumReservationCapacity,
        numberOfSeatsMen: numberOfSeatsMen,
        numberOfSeatsWomen: numberOfSeatsWomen,
        numberOfFlightAttendantsMen: numberOfFlightAttendantsMen,
        numberOfFlightAttendantsWomen: numberOfFlightAttendantsWomen,
        numberOfEntrances: numberOfEntrances,
        selectedDateTime: DateTime.now(),
        imageUrl: basename(_image?.path ?? ''),
        token: '',
        selectedTiming: '',
        hallType: hallType, // تأكد من إضافة هذا الحقل
      );

      await _addhallViewModel.saveHallData(hallModel, _image);

      print("Successfully saved hall data");

      // Reset fields after saving data
      setState(() {
        hallName = '';
        hallLocation = '';
        reservationPrice = '';
        numberOfSections = 0;
        minimumReservationCapacity = 0;
        numberOfSeatsMen = 0;
        numberOfSeatsWomen = 0;
        numberOfFlightAttendantsMen = 0;
        numberOfFlightAttendantsWomen = 0;
        numberOfEntrances = 0;
        hallType = 'Open';
        _image = null;
        _hallNameController.clear();
        _hallLocationController.clear();
        _reservationPriceController.clear();
        _numberOfSectionsController.clear();
        _minimumReservationCapacityController.clear();
        _numberOfSeatsMenController.clear();
        _numberOfSeatsWomenController.clear();
        _numberOfFlightAttendantsMenController.clear();
        _numberOfFlightAttendantsWomenController.clear();
        _numberOfEntrancesController.clear();
      });

    } catch (e) {
      print("Error saving hall data: ${e.toString()}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hall'),
        centerTitle: true,
      ),
      body: Container(
        color: const Color(0xFFF8BBD0),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: _hallNameController,
                  onChanged: (value) => hallName = value,
                  decoration: const InputDecoration(labelText: 'Hall Name'),
                ),
                TextFormField(
                  controller: _hallLocationController,
                  onChanged: (value) => hallLocation = value,
                  decoration: const InputDecoration(labelText: 'Hall Location'),
                ),
                _image == null
                    ? const Text('No image selected.')
                    : Image.file(_image!),
                ElevatedButton(
                  onPressed: _pickImage,
                  child: const Text('Upload Image'),
                ),
                TextFormField(
                  controller: _reservationPriceController,
                  onChanged: (value) => reservationPrice = value,
                  decoration: const InputDecoration(labelText: 'Reservation Price'),
                ),
                TextFormField(
                  controller: _numberOfSectionsController,
                  onChanged: (value) => numberOfSections = int.tryParse(value) ?? 0,
                  decoration: const InputDecoration(labelText: 'Number of Sections'),
                ),
                TextFormField(
                  controller: _minimumReservationCapacityController,
                  onChanged: (value) => minimumReservationCapacity = int.tryParse(value) ?? 0,
                  decoration: const InputDecoration(labelText: 'Minimum Reservation Capacity'),
                ),
                TextFormField(
                  controller: _numberOfSeatsMenController,
                  onChanged: (value) => numberOfSeatsMen = int.tryParse(value) ?? 0,
                  decoration: const InputDecoration(labelText: 'Number of Seats for Men'),
                ),
                TextFormField(
                  controller: _numberOfSeatsWomenController,
                  onChanged: (value) => numberOfSeatsWomen = int.tryParse(value) ?? 0,
                  decoration: const InputDecoration(labelText: 'Number of Seats for Women'),
                ),
                TextFormField(
                  controller: _numberOfFlightAttendantsMenController,
                  onChanged: (value) => numberOfFlightAttendantsMen = int.tryParse(value) ?? 0,
                  decoration: const InputDecoration(labelText: 'Number of Flight Attendants (Men)'),
                ),
                TextFormField(
                  controller: _numberOfFlightAttendantsWomenController,
                  onChanged: (value) => numberOfFlightAttendantsWomen = int.tryParse(value) ?? 0,
                  decoration: const InputDecoration(labelText: 'Number of Flight Attendants (Women)'),
                ),
                TextFormField(
                  controller: _numberOfEntrancesController,
                  onChanged: (value) => numberOfEntrances = int.tryParse(value) ?? 0,
                  decoration: const InputDecoration(labelText: 'Number of Entrances (Doors)'),
                ),
                DropdownButtonFormField<String>(
                  value: hallType,
                  onChanged: (String? newValue) {
                    setState(() {
                      hallType = newValue!;
                    });
                  },
                  items: <String>['Open', 'Closed'].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  decoration: const InputDecoration(labelText: 'Hall Type'),
                ),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: _saveHallData,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF7469B6),
                      ),
                      child: const Text('Save Hall Data', style: TextStyle(color: Colors.white)),
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
