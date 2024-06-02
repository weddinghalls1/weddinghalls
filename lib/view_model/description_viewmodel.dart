import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/descriptionhall_mode.dart';


class DescriptionViewModel {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;


  Future<DescriptionModel> fetchDescription() async {
    try {
      DocumentSnapshot doc = await _firestore.collection('rahaf').doc('descnption_halls').get();
      if (doc.exists) {
        return DescriptionModel.fromMap(doc.data() as Map<String, dynamic>);
      } else {
        throw Exception("Document not found");
      }
    } catch (e) {
      throw Exception("Error fetching data: $e");
    }
  }
}
