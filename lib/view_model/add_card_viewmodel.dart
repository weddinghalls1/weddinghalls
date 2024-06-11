import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/add_card_model.dart';

class CardViewModel {
  Future<void> saveCardDetails(CardModel card) async {
    try {
      await FirebaseFirestore.instance
          .collection(card.cardType)
          .add(card.toJson());
      print('Card Added');
    } catch (error) {
      print('Failed to add card: $error');
    }
  }
}
