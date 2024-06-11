import 'package:flutter/material.dart';

class AdminHallsScreen extends StatefulWidget {
  const AdminHallsScreen({super.key});

  @override
  State<AdminHallsScreen> createState() => _AdminHallsScreenState();
}

class _AdminHallsScreenState extends State<AdminHallsScreen> {
  final List<Map<String, dynamic>> halls = [
    {
      'image': 'images/Senussi_Places.jpeg',
      'title': 'Senussi Places',
      'rating': 4.5,
      'price': 500,
      'location': 'Ramallah'
    },
    {
      'image': 'images/Open_air.jpeg',
      'title': 'Open Air',
      'rating': 4.8,
      'price': 750,
      'location': 'Nablus'
    },
    {
      'image': 'images/KataleaPalace2.jpeg',
      'title': 'Katalea Palace',
      'rating': 4.3,
      'price': 400,
      'location': 'Ramalla'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Halls"),
      ),
      backgroundColor: const Color(0xffFFE6E6),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: halls.length,
        itemBuilder: (context, index) {
          final hall = halls[index];
          return Card(
            color: const Color.fromARGB(255, 255, 255, 255),
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      hall['image'],
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
                          hall['title'],
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
                            Text('${hall['rating']}'),
                            const SizedBox(width: 20),
                            Text(
                              '\$${hall['price']}',
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          hall['location'],
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
