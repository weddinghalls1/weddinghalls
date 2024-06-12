import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../model/checkout_model.dart';

class CardViewModel {
  Future<void> saveCardDetails(CardModel card) async {
    try {
      await FirebaseFirestore.instance
          .collection('cards')
          .add(card.toMap());
    } catch (e) {
      print('Error saving card details: $e');
    }
  }
}