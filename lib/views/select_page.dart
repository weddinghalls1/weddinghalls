import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'list_halls.dart';

class HallSelectionPage extends StatefulWidget {
  @override
  _HallSelectionPageState createState() => _HallSelectionPageState();
}
class _HallSelectionPageState extends State<HallSelectionPage> {
  String? _hallType;
  void _handleRadioValueChange(String? value) {
    setState(() {
      _hallType = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffFFE6E6),
        appBar: AppBar(
          title: const Text(
            'Select Type of Hall',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: Center(
          child : Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: Container(
                  height: 160,
                  width: 430,
                  decoration:  BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: _hallType == 'Open' ? Color(0xffcdade1) : Colors.white,
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top:50),
                    child: ListTile(
                      leading: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Radio<String>(
                            value: 'Open',
                            groupValue: _hallType,
                            onChanged: _handleRadioValueChange,
                          ),
                          SizedBox(width: 20,),
                          SizedBox(
                            width: 100,
                            height: 100,
                            child: Image.asset(
                              'images/open.jpeg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                      title: const Text(
                        'Open',
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Container(
                  height: 160,
                  width: 430,
                  decoration:  BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: _hallType == 'Closed' ? Color(0xffcdade1) : Colors.white,
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: 50),
                    child: ListTile(
                      leading: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Radio<String>(
                            value: 'Closed',
                            groupValue: _hallType,
                            onChanged: _handleRadioValueChange,
                          ),
                          SizedBox(width: 20,),
                          SizedBox(
                            width: 100,
                            height: 100,
                            child: Image.asset(
                              'images/closed.jpeg',
                              fit: BoxFit.cover,
                            ),
                          ),

                        ],
                      ),

                      title: const Text(
                        'Closed',
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 80),
                child: ElevatedButton(
                  onPressed: (){
                    if(_hallType != null){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => NextPage(hallType: _hallType!),
                          )
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15), // Bigger button size
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8), // Optional rounded corners
                    ),
                    backgroundColor: Color(0xffAD88C6),
                  ),
                  child: const Text(
                    'Next',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}

