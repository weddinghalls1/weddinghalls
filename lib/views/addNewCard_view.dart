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
  final _cvcController = TextEditingController();

  String _selectedCardType = 'mastercard';

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
                    Text(
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
                          Image.network(
                            'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2a/Mastercard-logo.svg/1200px-Mastercard-logo.svg.png',
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
                          Image.network(
                            'https://upload.wikimedia.org/wikipedia/commons/thumb/3/30/American_Express_logo.svg/1200px-American_Express_logo.svg.png',
                            width: 50,
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
                          Image.network(
                            'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5e/Visa_Inc._logo.svg/1200px-Visa_Inc._logo.svg.png',
                            width: 50,
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 30),
                   Padding(
                       padding:EdgeInsets.only(right: 220),
                     child: Text(
                       'CARD NUMBER',
                       style: TextStyle(fontSize: 20),
                     ),
                   ),
                    TextField(
                      controller: _cardNumberController,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: 15),
                    Padding(
                      padding:EdgeInsets.only(right: 170),
                      child: Text(
                        'CARDHOLDER NAME',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    TextField(
                      controller: _cardholderNameController,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    ),
                    SizedBox(height: 15),
                    Row(
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
                            'CVC',
                            style: TextStyle(fontSize: 20)
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _expirationDateController,
                            decoration: InputDecoration(
                              hintText: 'MM / YY',
                              fillColor: Colors.white,
                              filled: true,
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            controller: _cvcController,
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
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
                child: Text(
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
    final card = CardModel(
      cardNumber: _cardNumberController.text,
      cardholderName: _cardholderNameController.text,
      expirationDate: _expirationDateController.text,
      cvc: _cvcController.text,
      cardType: _selectedCardType,
    );

    _cardViewModel.saveCardDetails(card);
  }
  @override
  void dispose() {
    _cardNumberController.dispose();
    _cardholderNameController.dispose();
    _expirationDateController.dispose();
    _cvcController.dispose();
    super.dispose();
  }
}


