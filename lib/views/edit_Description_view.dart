import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:weddinghalls/view_model/edit_description_viewmodel.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../model/edit_description_model.dart';

class EditHallDescription extends StatefulWidget {
  const EditHallDescription({Key? key}) : super(key: key);

  @override
  State<EditHallDescription> createState() => _HallScreenState();
}

class _HallScreenState extends State<EditHallDescription> {
  final EditViewModel viewModel = EditViewModel();

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

  final ImagePicker _picker = ImagePicker();
  String? _newImageUrl;

  @override
  void initState() {
    super.initState();
    String initialToken = 'hall1';
    viewModel.fetchHallData(initialToken).then((_) {
      if (mounted) {
        setState(() {
          hallNameController.text = viewModel.hallModel.hallName ?? '';
          hallLocationController.text = viewModel.hallModel.hallLocation ?? '';
          imageUrlController.text = viewModel.hallModel.imageUrl ?? '';
          minimumReservationCapacityController.text = viewModel.hallModel.minimumReservationCapacity ?? '';
          numberOfEntrancesController.text = viewModel.hallModel.numberOfEntrances ?? '';
          numberOfFlightAttendantsMenController.text = viewModel.hallModel.numberOfFlightAttendantsMen ?? '';
          numberOfFlightAttendantsWomenController.text = viewModel.hallModel.numberOfFlightAttendantsWomen ?? '';
          numberOfSeatsMenController.text = viewModel.hallModel.numberOfSeatsMen ?? '';
          numberOfSeatsWomenController.text = viewModel.hallModel.numberOfSeatsWomen ?? '';
          numberOfSectionsController.text = viewModel.hallModel.numberOfSections ?? '';
          reservationPriceController.text = viewModel.hallModel.reservationPrice ?? '';
        });
      }
    }).catchError((e){
      print('Error in initState: $e');
    });
  }


  Future<void> _pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      final Reference storageReference = FirebaseStorage.instance.ref().child('halls').child(fileName);
      final UploadTask uploadTask = storageReference.putFile(File(pickedFile.path));
      final TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() {});
      final String downloadUrl = await taskSnapshot.ref.getDownloadURL();

      setState(() {
        _newImageUrl = downloadUrl;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFE6E6),
      appBar: AppBar(
        title: const Text(
          'Edit Description Hall',
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
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8),
              Padding(
                padding: EdgeInsets.only(top: 5),
                child: Container(
                  height: 260,
                  width: 400,
                  //color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      Image.network(
                        _newImageUrl ?? viewModel.hallModel.imageUrl ?? '',
                        width: 350,
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
                      Center(
                        child: Padding(
                          padding: EdgeInsets.only(top: 10),
                          child:SizedBox(
                            width: 180,
                            child: ElevatedButton(
                              onPressed: _pickImage,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF7469B6),
                              ),
                              child: Text('Edit', style: TextStyle(color: Colors.white, fontSize: 20)),
                            ),
                          ),
                        ),
                      ),
                    ],
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
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8),
              Padding(
                padding: EdgeInsets.only(top: 5),
                child:ElevatedButton(
                  onPressed: () async {
                    viewModel.hallModel = HallModel(
                      hallName: hallNameController.text,
                      hallLocation: hallLocationController.text,
                      imageUrl: _newImageUrl ?? imageUrlController.text, // Use the new image URL if available
                      minimumReservationCapacity: minimumReservationCapacityController.text,
                      numberOfEntrances: numberOfEntrancesController.text,
                      numberOfFlightAttendantsMen: numberOfFlightAttendantsMenController.text,
                      numberOfFlightAttendantsWomen: numberOfFlightAttendantsWomenController.text,
                      numberOfSeatsMen: numberOfSeatsMenController.text,
                      numberOfSeatsWomen: numberOfSeatsWomenController.text,
                      numberOfSections: numberOfSectionsController.text,
                      reservationPrice: reservationPriceController.text,
                    );
                    try {
                      await viewModel.updateHallData('hall1');
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Profile updated successfully')),
                      );
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Failed to update profile: $e')),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF7469B6),
                  ),
                  child: Text('Save', style: TextStyle(color: Colors.white, fontSize: 20)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}