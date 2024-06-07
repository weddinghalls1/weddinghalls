import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart'; // Import url_launcher package
import '../model/Myhall1.dart';
import '../view_model/Myhall2.dart';
import 'HallCards.dart';

class HallsPage extends StatelessWidget {
  final HallsViewModel viewModel = HallsViewModel();
  final List<String> documentIds = ['1', '2', '3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Halls'),
      ),
      backgroundColor: Color(0xFFFFC0CB), // Pastel pink color
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder<List<String>>(
              future: viewModel.fetchAdUrls(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('No Ads Available'));
                } else {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CarouselSlider(
                      options: CarouselOptions(
                        height: MediaQuery.of(context).size.height * 0.45,
                        autoPlay: true,
                        enlargeCenterPage: true,
                        aspectRatio: 16/9,
                        autoPlayInterval: Duration(seconds: 3),
                      ),
                      items: snapshot.data!.map((url) {
                        return Builder(
                          builder: (BuildContext context) {
                            return GestureDetector(
                              onTap: () async {
                                if (await canLaunch(url)) {
                                  await launch(url);
                                } else {
                                  throw 'Could not launch $url';
                                }
                              },
                              child: Image.network(
                                url,
                                fit: BoxFit.cover,
                                width: MediaQuery.of(context).size.width,
                              ),
                            );
                          },
                        );
                      }).toList(),
                    ),
                  );
                }
              },
            ),
            FutureBuilder<Hall?>(
              future: viewModel.fetchHallById(documentIds[0]),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data == null) {
                  return Center(child: Text('No Hall Available'));
                } else {
                  return Column(
                    children: [
                      MyCard(hall: snapshot.data!),
                      SizedBox(height: 1), // Reduced space between cards
                    ],
                  );
                }
              },
            ),
            FutureBuilder<Hall?>(
              future: viewModel.fetchHallById(documentIds[1]),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data == null) {
                  return Center(child: Text('No Hall Available'));
                } else {
                  return Column(
                    children: [
                      MyCard(hall: snapshot.data!),
                      SizedBox(height: 1), // Reduced space between cards
                    ],
                  );
                }
              },
            ),
            FutureBuilder<Hall?>(
              future: viewModel.fetchHallById(documentIds[2]),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data == null) {
                  return Center(child: Text('No Hall Available'));
                } else {
                  return Column(
                    children: [
                      MyCard(hall: snapshot.data!),
                      SizedBox(height: 1), // Reduced space between cards
                    ],
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}