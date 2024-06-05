import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:weddinghalls/model/hall_model_data.dart';
import 'package:weddinghalls/model/hall_model_favorite_data.dart';

class HallsViewModel {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<HallModel>> getHalls() async {
    try {
      QuerySnapshot querySnapshot = await _firestore.collection('the_halls').get();

      return querySnapshot.docs
          .map((doc) => HallModel.fromFirestore(doc))
          .toList();
    } catch (e) {
      print('Error fetching halls: $e');
      return [];
    }
  }

  Future<void> addFavoriteHall(HallModel? hall, String userId) async {
    try {
      CollectionReference favoriteHallsRef =
      _firestore.collection('favorite_halls');

      Map<String, dynamic> hallData = hall!.toMap();
      hallData['user_id'] = userId;

      await favoriteHallsRef.add(hallData);
      print('Hall added to favorites successfully');
    } catch (e) {
      print('Error adding hall to favorites: $e');
    }
  }

  Future<List<HallFavorite>> getFavoriteHalls(String userId) async {
    try {
      // Reference to the favorite_halls collection
      CollectionReference favoriteHallsRef =
      _firestore.collection('favorite_halls');

      QuerySnapshot querySnapshot =
      await favoriteHallsRef.where('user_id', isEqualTo: userId).get();

      List<HallFavorite> favoriteHalls = querySnapshot.docs
          .map((doc) => HallFavorite.fromFirestore(doc))
          .toList();

      return favoriteHalls;
    } catch (e) {
      print('Error fetching favorite halls: $e');
      return []; // Return an empty list in case of error
    }
  }

  Future<void> addHalls() async {
    CollectionReference hallsCollection =
    FirebaseFirestore.instance.collection('halls');




    List<HallModel> hallList = [
      HallModel(
        name: "Banquet Hall",
        rating: 4,
        imageUrl: "images/closed.jpeg",
        isOpen: true,
        priceReservation: 5000,
      ),
      HallModel(
        name: "Conference Hall",
        rating: 4,
        imageUrl: "images/closed.jpeg",
        isOpen: false,
        priceReservation: 3000,
      ),
      HallModel(
        name: "Wedding Hall",
        rating: 5,
        imageUrl: "images/closed.jpeg",
        isOpen: true,
        priceReservation: 8000,
      ),
      HallModel(
        name: "Party Hall",
        rating: 3,
        imageUrl: "images/closed.jpeg",
        isOpen: true,
        priceReservation: 2000,
      ),
      HallModel(
        name: "Meeting Hall",
        rating: 4,
        imageUrl: "images/closed.jpeg",
        isOpen: false,
        priceReservation: 4000,
      ),
    ];

    for (HallModel hall in hallList) {
      await hallsCollection.add(hall.toMap());
    }

  }
}
// TODO Implement this library.