import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../model/checkout_model.dart';

class CardViewModel extends ChangeNotifier {
  CardModel? _card;
  CardModel? get card => _card;

  Future<void> fetchCardDetails() async {
    try {
      DocumentSnapshot doc = await FirebaseFirestore.instance
          .collection('rahaf')
          .doc('cards')
          .get();
      _card = CardModel.fromMap(doc.data() as Map<String, dynamic>);
      notifyListeners();
    } catch (e) {
      print('Error fetching card details: $e');
    }
  }
}
