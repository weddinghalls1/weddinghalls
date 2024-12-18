import 'package:flutter/material.dart';
import 'package:weddinghalls/views/sidbar.dart';
import '../model/home_model.dart';
import '../view_model/home_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeViewModel viewModel = HomeViewModel();

  @override
  void initState() {
    super.initState();
    viewModel.fetchData();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wedding Halls"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      drawer:Sidebar(),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffFFE6E6),
            border: Border.all(color: Colors.black, width: 8),
          ),
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Center(
                child: Text(
                  "Hello!",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              Center(
                child: Text(
                  "Welcome to Your Perfect Wedding Journey.",
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.black,
                  ),
                ),
              ),
              Center(
                child: Image.asset('images/logo.png',
                    width: 200, height: 200, fit: BoxFit.cover),
              ),
              FutureBuilder(
                future: viewModel.fetchData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text("Error: ${snapshot.error}"));
                  } else {
                    if (viewModel.halls.isEmpty) {
                      return Center(child: Text("No halls available"));
                    } else {
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: viewModel.halls.length,
                        itemBuilder: (context, index) {
                          return buildHallItem(context, viewModel.halls[index]);
                        },
                      );
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildHallItem(BuildContext context, HomeHallModel hall) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            // Navigator.push(
            // context,
            // MaterialPageRoute(builder: (context) => HallDetailsScreen(hall: hall)),
            // );
          },
          child: Image.network(hall.imageUrl,
              width: 200, height: 200, fit: BoxFit.cover),
        ),
        Center(
          child: Text(
            hall.details,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
