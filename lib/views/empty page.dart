import 'package:flutter/material.dart';
import '../model/Myhall1.dart';

class HallDetailsPage extends StatelessWidget {
  final Hall hall;

  const HallDetailsPage({Key? key, required this.hall}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(hall.hallName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(hall.imageUrl, fit: BoxFit.cover),
            SizedBox(height: 16),
            Text(
              hall.hallName,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.star, color: Colors.yellow),
                SizedBox(width: 4),
                Text(hall.stars, style: TextStyle(fontSize: 18)),
                SizedBox(width: 16),
                Text('\$${hall.price}', style: TextStyle(fontSize: 18)),
              ],
            ),
            SizedBox(height: 16),
            Text(hall.description, style: TextStyle(fontSize: 16)),
            SizedBox(height: 16),
            Row(
              children: [
                Icon(Icons.location_on, color: Color(0xFF7469B6)),
                SizedBox(width: 4),
                Text(hall.location, style: TextStyle(fontSize: 16)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}