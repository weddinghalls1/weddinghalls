
class CardModel {
  final String cardNumber;
  final String cardholderName;
  final String expirationDate;
  final String cvv;
  final String cardType;

  CardModel({
    required this.cardNumber,
    required this.cardholderName,
    required this.expirationDate,
    required this.cvv,
    required this.cardType,
  });

  Map<String, dynamic> toJson() {
    return {
      'cardNumber': cardNumber,
      'cardholderName': cardholderName,
      'expirationDate': expirationDate,
      'cvv': cvv,
      'cardType': cardType,
    };
  }
}