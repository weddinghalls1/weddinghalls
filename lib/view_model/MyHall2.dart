import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/Myhall1.dart';

class HallsViewModel {
  Future<Hall?> fetchHallById(String documentId) async {
    try {
      DocumentSnapshot doc = await FirebaseFirestore.instance.collection('myHalls').doc(documentId).get();
      if (doc.exists) {
        return Hall.fromFirestore(doc.data() as Map<String, dynamic>, doc.id);
      } else {
        print('Document with ID $documentId does not exist.');
        return null;
      }
    } catch (e) {
      print('Error fetching hall: $e');
      rethrow;
    }
  }

  Future<List<String>> fetchAdUrls() async {
    try {
      DocumentSnapshot doc = await FirebaseFirestore.instance.collection('myHalls').doc('ads').get();
      if (doc.exists) {
        List<dynamic> urls = doc.get('urls');
        return urls.cast<String>();
      } else {
        print('Ad document does not exist.');
        return [];
      }
    } catch (e) {
      print('Error fetching ads: $e');
      rethrow;
    }
  }
}