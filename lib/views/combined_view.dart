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

  String? selectedTiming;
  File? _image;

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
          selectedTiming: selectedTiming!,
          imageUrl: basename(_image!.path),
          token: ''
      );

      await _addhallViewModel.saveHallData(hallModel, _image);

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
                  onChanged: (value) => hallName = value,
                  decoration: const InputDecoration(labelText: 'Hall Name'),
                ),
                TextFormField(
                  onChanged: (value) => hallLocation = value,
                  decoration: const InputDecoration(labelText: 'Hall Location'),
                ),
                _image == null ? const Text('No image selected.') : Image.file(_image!),
                ElevatedButton(
                  onPressed: _pickImage,
                  child: const Text('Upload Image'),
                ),
                TextFormField(
                  onChanged: (value) => reservationPrice = value,
                  decoration: const InputDecoration(labelText: 'Reservation Price'),
                ),
                TextFormField(
                  onChanged: (value) => numberOfSections = int.tryParse(value) ?? 0,
                  decoration: const InputDecoration(labelText: 'Number of Sections'),
                ),
                TextFormField(
                  onChanged: (value) => minimumReservationCapacity = int.tryParse(value) ?? 0,
                  decoration: const InputDecoration(labelText: 'Minimum Reservation Capacity'),
                ),
                TextFormField(
                  onChanged: (value) => numberOfSeatsMen = int.tryParse(value) ?? 0,
                  decoration: const InputDecoration(labelText: 'Number of Seats for Men'),
                ),
                TextFormField(
                  onChanged: (value) => numberOfSeatsWomen = int.tryParse(value) ?? 0,
                  decoration: const InputDecoration(labelText: 'Number of Seats for Women'),
                ),
                TextFormField(
                  onChanged: (value) => numberOfFlightAttendantsMen = int.tryParse(value) ?? 0,
                  decoration: const InputDecoration(labelText: 'Number of Flight Attendants (Men)'),
                ),
                TextFormField(
                  onChanged: (value) => numberOfFlightAttendantsWomen = int.tryParse(value) ?? 0,
                  decoration: const InputDecoration(labelText: 'Number of Flight Attendants (Women)'),
                ),
                TextFormField(
                  onChanged: (value) => numberOfEntrances = int.tryParse(value) ?? 0,
                  decoration: const InputDecoration(labelText: 'Number of Entrances (Doors)'),
                ),
                const SizedBox(height: 20.0),
                const Text('Select Timing:', style: TextStyle(color: Colors.black)),
                CheckboxListTile(
                  title: const Text('Morning reservation (9:00 AM - 11:30 AM)'),
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
                  title: const Text('Evening reservation (2:00 PM - 4:30 PM)'),
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
                  title: const Text('Late evening reservation (7:00 PM - 9:30 PM)'),
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
