import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

class EditHallDescription extends StatefulWidget {
  const EditHallDescription({super.key});

  @override
  State<EditHallDescription> createState() => _HallScreenState();
}

class _HallScreenState extends State<EditHallDescription> {

  DateTime? selectedDateTime = DateTime.now();
  String? selectedTiming;
  //File? _image;

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
      backgroundColor: Color(0xffFFE6E6),
      appBar: AppBar(
        title: const Text(
          'Edit Description Hall',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView( // Wrap the Column in a SingleChildScrollView
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                width: 400,
                height: 180,
                //color: Colors.white,
                margin: EdgeInsets.only(top: 10),
                child: const Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(right: 290),
                      child: Text(
                        'Hall Name',
                        style: TextStyle( fontSize: 20),
                      ),
                    ),
                    //SizedBox(height: 8),
                    TextField(
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    ),
                    SizedBox(height: 15),
                    Padding(
                      padding: EdgeInsets.only(right: 260),
                      child: Text(
                        'Hall Location',
                        style: TextStyle( fontSize: 20),
                      ),
                    ),
                    //SizedBox(height: 8),
                    TextField(
                      decoration: InputDecoration(
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
                  height: 150,
                  width: 400,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 8),
              Container(
                height: 720,
                width: 400,
                //color: Colors.white,
                child: const Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(right: 230),
                      child: Text(
                        'Reservation Price',
                        style: TextStyle( fontSize: 20),
                      ),
                    ),
                    //SizedBox(height: 5),
                    TextField(
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    ),
                    SizedBox(height: 15),
                    Padding(
                      padding: EdgeInsets.only(right: 210),
                      child: Text(
                        'Number of Sections',
                        style: TextStyle( fontSize: 20),
                      ),
                    ),
                    //SizedBox(height: 5),
                    TextField(
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    ),
                    SizedBox(height: 15,),
                    Padding(
                      padding: EdgeInsets.only(right: 110),
                      child: Text(
                        'Minimum Reservation Capacity',
                        style: TextStyle( fontSize: 20),
                      ),
                    ),
                    //SizedBox(height: 5),
                    TextField(
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    ),
                    SizedBox(height: 15),
                    Padding(
                      padding: EdgeInsets.only(right: 160),
                      child: Text(
                        'Number of Seats for Men',
                        style: TextStyle( fontSize: 20),
                      ),
                    ),
                    //SizedBox(height: 5),
                    TextField(
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    ),
                    SizedBox(height: 15,),
                    Padding(
                      padding: EdgeInsets.only(right: 135),
                      child: Text(
                        'Number of Seats for Women',
                        style: TextStyle( fontSize: 20),
                      ),
                    ),
                    //SizedBox(height: 5),
                    TextField(
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    ),
                    SizedBox(height: 15),
                    Padding(
                      padding: EdgeInsets.only(right: 80),
                      child: Text(
                        'Number of Flight Attendants (Men)',
                        style: TextStyle( fontSize: 20),
                      ),
                    ),
                    //SizedBox(height: 5),
                    TextField(
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 50),
                      child: Text(
                        'Number of Flight Attendants (Women)',
                        style: TextStyle( fontSize: 20),
                      ),
                    ),
                    //SizedBox(height: 5),
                    TextField(
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    ),
                    SizedBox(height: 15),
                    Padding(
                      padding: EdgeInsets.only(right: 140),
                      child: Text(
                        'Number of Entrances (Door)',
                        style: TextStyle( fontSize: 20),
                      ),
                    ),
                    //SizedBox(height: 5),
                    TextField(
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8,),
              Padding(
                padding: EdgeInsets.only(top: 5),
                child: Container(
                  height: 410,
                  width: 400,
                  //color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () => _selectDateTime(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF7469B6),
                          minimumSize: Size(400, 45),
                        ),
                        child: Text('Select Date', style: TextStyle(color: Colors.white, fontSize: 20)),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        'Selected Date: ${selectedDateTime?.toString().split(' ')[0]}',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 20.0),
                      Text('Select Timing:', style: TextStyle(color: Colors.black, fontSize: 20)),
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
                      ElevatedButton(
                        onPressed: () {
                          // Add to favorites functionality
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF7469B6),
                        ),
                        child: Text('Save', style: TextStyle(color: Colors.white, fontSize: 20)),
                      ),
                    ],
                  ),
                  //SizedBox(height: 20.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
