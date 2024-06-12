import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:weddinghalls/model/edit_description_model.dart';

class EditViewModel {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  HallModel hallModel = HallModel();


  Future<void> fetchHallData(String token) async {
    try{
      print("Fetching data for token: $token");
      QuerySnapshot querySnapshot = await _firestore
          .collection('halls')
          .where('token', isEqualTo: token)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        var hallData = querySnapshot.docs.first.data() as Map<String, dynamic>;
        hallModel = HallModel.fromMap(hallData);
        print('Data fetched successfully: ${hallModel.toMap()}');
      } else {
        print('No hall found with token: $token');
      }

    }catch (e) {
      print('Error fetching hall data: $e');
      throw e;
    }
  }




  Future<void> updateHallData(String token) async {

    try {
      print("Updating data for token: $token");
      QuerySnapshot querySnapshot = await _firestore
          .collection('halls')
          .where('token', isEqualTo: token)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        String documentId = querySnapshot.docs.first.id;

        await _firestore.collection('halls').doc(documentId).update(hallModel.toMap());
        print('Data updated successfully');
      } else {
        print('No hall found with token: $token');
      }
    } catch (error) {
      print('Error updating Data for Halls: $error');
    }
  }


}