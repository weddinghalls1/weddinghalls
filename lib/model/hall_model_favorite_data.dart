import 'package:cloud_firestore/cloud_firestore.dart';

class HallFavorite {
  final String name;
  final int rating;
  final bool isOpen;
  final String imageUrl;
  final int priceReservation;
  final int? status;
  final String userId;
  HallFavorite(
      {required this.name,
        required this.rating,
        required this.isOpen,
        required this.imageUrl,
        required this.priceReservation,
        this.status,
        required this.userId});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'rating': rating,
      'isOpen': isOpen,
      'imageUrl': imageUrl,
      'priceReservation': priceReservation,
      "status": status
    };
  }

  factory HallFavorite.fromFirestore(DocumentSnapshot doc) {
    return HallFavorite(
      name: doc['name'] as String,
      status: doc["status"] as int,
      rating: doc['rating'] as int,
      isOpen: doc['isOpen'] as bool,
      imageUrl: doc['imageUrl'] as String,
      priceReservation: doc['priceReservation'] as int,
      userId: doc["user_id"] as String,
    );
  }
}
