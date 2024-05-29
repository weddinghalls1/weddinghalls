import 'package:firebase_database/firebase_database.dart';
import 'package:weddinghalls/model/add_card_model.dart';

class CardViewModel {
  final DatabaseReference _dbRef = FirebaseDatabase.instance.reference();

  Future<void> saveCardDetails(CardModel card) async {
    try {
      await _dbRef.child(card.cardType).push().set(card.toJson());
      print('Card Added');
    } catch (error) {
      print('Failed to add card: $error');
    }
  }
}