import 'package:flutter/material.dart';

class HallScreen extends StatefulWidget {
  const HallScreen({super.key});

  @override
  State<HallScreen> createState() => _HallScreenState();
}

class _HallScreenState extends State<HallScreen> {
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
                color: Colors.white,
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
                color: Colors.white,
                child: const Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(right: 290),
                      child: Text(
                        'Hall Name',
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
                      padding: EdgeInsets.only(right: 260),
                      child: Text(
                        'Hall Location',
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
                      padding: EdgeInsets.only(right: 290),
                      child: Text(
                        'Hall Name',
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
                      padding: EdgeInsets.only(right: 260),
                      child: Text(
                        'Hall Location',
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
                      padding: EdgeInsets.only(right: 290),
                      child: Text(
                        'Hall Name',
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
                      padding: EdgeInsets.only(right: 260),
                      child: Text(
                        'Hall Location',
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
                      padding: EdgeInsets.only(right: 290),
                      child: Text(
                        'Hall Name',
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
                      padding: EdgeInsets.only(right: 260),
                      child: Text(
                        'Hall Location',
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
                  height: 150,
                  width: 400,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
