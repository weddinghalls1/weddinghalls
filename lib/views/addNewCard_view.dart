import 'package:flutter/material.dart';
import 'package:weddinghalls/model/add_card_model.dart';
import '../view_model/add_card_viewmodel.dart';

class AddCardPayment extends StatefulWidget {
  const AddCardPayment({super.key});

  @override
  State<AddCardPayment> createState() => _AddCardPaymentState();
}

class _AddCardPaymentState extends State<AddCardPayment> {
  final _cardNumberController = TextEditingController();
  final _cardholderNameController = TextEditingController();
  final _expirationDateController = TextEditingController();
  final _cvvController = TextEditingController();

  String _selectedCardType = '';

  final CardViewModel _cardViewModel = CardViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFE6E6),
      appBar: AppBar(
        title: Text('Add New Card'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(30),
              child: Container(
                height: 600,
                width: 500,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.black,
                    width: 3,
                  ),
                ),
                child: Column(
                  children: [
                    const Text(
                      'CARD DETAILS',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                    SizedBox(height: 30),
                    Padding(
                        padding:EdgeInsets.only(left: 25),
                      child: Row(
                        children: [
                          Radio<String>(
                            value: 'mastercard',
                            groupValue: _selectedCardType,
                            onChanged: (value) {
                              setState(() {
                                _selectedCardType = value!;
                              });
                            },
                          ),
                          Image.asset(
                              'images/mastercard.png',
                            width: 50,
                          ),
                          Radio<String>(
                            value: 'amex',
                            groupValue: _selectedCardType,
                            onChanged: (value) {
                              setState(() {
                                _selectedCardType = value!;
                              });
                            },
                          ),
                          Image.asset(
                            'images/amex.png',
                            width: 60,
                          ),
                          Radio<String>(
                            value: 'visa',
                            groupValue: _selectedCardType,
                            onChanged: (value) {
                              setState(() {
                                _selectedCardType = value!;
                              });
                            },
                          ),
                          Image.asset(
                            'images/visa.png',
                            width: 60,
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 30),
                    const Padding(
                       padding:EdgeInsets.only(right: 220),
                     child: Text(
                       'CARD NUMBER',
                       style: TextStyle(fontSize: 20),
                     ),
                   ),
                    TextField(
                      controller: _cardNumberController,
                      decoration: const InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        prefixIcon: Icon(Icons.credit_card),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: 15),
                    const Padding(
                      padding:EdgeInsets.only(right: 170),
                      child: Text(
                        'CARDHOLDER NAME',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    TextField(
                      controller: _cardholderNameController,
                      decoration: const InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        prefixIcon: Icon(Icons.person),
                      ),
                    ),
                    SizedBox(height: 15),
                    const Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            'EXPIRATION DATE',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        SizedBox(width: 30,),
                         Text(
                            'CVV',
                            style: TextStyle(fontSize: 20)
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _expirationDateController,
                            decoration: const InputDecoration(
                              hintText: 'MM / YY',
                              fillColor: Colors.white,
                              filled: true,
                              prefixIcon: Icon(Icons.calendar_today),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            controller: _cvvController,
                            decoration: const InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              prefixIcon: Icon(Icons.card_travel),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: _saveCardDetails,
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Color(0xff7469B6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                    'ADD',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  void _saveCardDetails() {
    final cardNumber = _cardNumberController.text;
    final cardholderName = _cardholderNameController.text;
    final expirationDate = _expirationDateController.text;
    final cvv = _cvvController.text;
    final cardType = _selectedCardType;

    if (cardNumber.isEmpty ||
        cardholderName.isEmpty ||
        expirationDate.isEmpty ||
        cvv.isEmpty ||
        cardType.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error'),
          content: const Text('All fields must be filled out.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        ),
      );
      return;
    }
    final card = CardModel(
      cardNumber: cardNumber,
      cardholderName: cardholderName,
      expirationDate: expirationDate,
      cvv: cvv,
      cardType: cardType,
    );

    _cardViewModel.saveCardDetails(card);
  }
  @override
  void dispose() {
    _cardNumberController.dispose();
    _cardholderNameController.dispose();
    _expirationDateController.dispose();
    _cvvController.dispose();
    super.dispose();
  }
}


