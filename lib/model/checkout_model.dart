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

  factory CardModel.fromMap(Map<String, dynamic> data) {
    return CardModel(
      cardNumber: data['cardNumber'] ?? '',
      cardholderName: data['cardholderName'] ?? '',
      expirationDate: data['expirationDate'] ?? '',
      cvc: data['cvc'] ?? '',
    );
  }
}
