import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:weddinghalls/model/hall_model.dart';
class AdminViewModelHall {
  Future<List<HallModel>> fetchAllHalls() async {
    try {
      QuerySnapshot hallSnapshot =
      await FirebaseFirestore.instance.collection('halls').get();
      return hallSnapshot.docs
          .map((doc) => HallModel.fromFirestore(doc))
          .toList();
    } catch (e) {
      print('Error fetching halls: $e');
      return [];
    }
  }
}