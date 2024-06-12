import 'package:flutter/material.dart';
import 'package:weddinghalls/model/hall_model.dart';
import 'package:weddinghalls/view_model/admin_halls_view_model.dart';
class AdminHallsScreen extends StatefulWidget {
  const AdminHallsScreen({super.key});
  @override
  State<AdminHallsScreen> createState() => _AdminHallsScreenState();
}
class _AdminHallsScreenState extends State<AdminHallsScreen> {
  final adminViewModel = AdminViewModelHall();
  List<HallModel> adminhalls = [];
  getData() async {
    adminhalls = await adminViewModel.fetchAllHalls();
    print(adminhalls.length);
    setState(() {});
  }
  @override
  void initState() {
    getData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Halls"),
      ),
      backgroundColor: const Color(0xffFFE6E6),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: adminhalls.length,
        itemBuilder: (context, index) {
          final hall = adminhalls[index];
          return Card(
            color: const Color.fromARGB(255, 255, 255, 255),
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      hall.imageUrl == ""
                          ? "https://th.bing.com/th/id/R.174d1d09fe1b5f15f427ea8411fe2a21?rik=1RMC%2bFU5tvWuRQ&pid=ImgRaw&r=0"
                          : hall.imageUrl,
                      width: 150,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          hall.hallName,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            const Icon(Icons.star,
                                color: Colors.yellow, size: 25),
                            const SizedBox(width: 4),
                            Text('5'),
                            const SizedBox(width: 20),
                            Text(
                              '\$${hall.reservationPrice}',
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          hall.hallLocation,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}