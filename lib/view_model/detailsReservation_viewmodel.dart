import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/detailsReservation_model.dart';


class DetailsReservation {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  DataRes? dataRes;


  Future<void> fetchResData(String token) async {
    try {
      QuerySnapshot querySnapshot = await _firestore
          .collection('halls')
          .where('token', isEqualTo: token)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        var hallData = querySnapshot.docs.first.data() as Map<String, dynamic>;

        dataRes = DataRes.fromMap(hallData);

        print('Data fetched successfully');
        print('Hall Name: ${dataRes?.hallName}');
        print('Hall Location: ${dataRes?.hallLocation}');
      } else {
        print('No hall found with token: $token');
      }
    } catch (e) {
      print('Error fetching hall data: $e');
      throw e;
    }
  }
}