class CardModel {
  final String cardNumber;
  final String cardholderName;
  final String expirationDate;
  final String cvc;

  CardModel({
    required this.cardNumber,
    required this.cardholderName,
    required this.expirationDate,
    required this.cvc,
  });

  Map<String, dynamic> toMap() {
    return {
      'cardNumber': cardNumber,
      'cardholderName': cardholderName,
      'expirationDate': expirationDate,
      'cvc': cvc,
    };
  }
}
