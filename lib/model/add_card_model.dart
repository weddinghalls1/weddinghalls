
class CardModel {
  final String cardNumber;
  final String cardholderName;
  final String expirationDate;
  final String cvc;
  final String cardType;

  CardModel({
    required this.cardNumber,
    required this.cardholderName,
    required this.expirationDate,
    required this.cvc,
    required this.cardType,
  });

  Map<String, dynamic> toJson() {
    return {
      'cardNumber': cardNumber,
      'cardholderName': cardholderName,
      'expirationDate': expirationDate,
      'cvc': cvc,
      'cardType': cardType,
    };
  }
}