import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/checkout_model.dart';
import '../view_model/checkout_viewmodel.dart';
import 'package:payment_card/payment_card.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CheckoutPage(),
    );
  }
}

class CheckoutPage extends StatefulWidget {
  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final _cardNumberController = TextEditingController();
  final _cardholderNameController = TextEditingController();
  final _expirationDateController = TextEditingController();
  final _cvcController = TextEditingController();

  String _cardNumber = '';
  String _cardholderName = '';
  String _expirationDate = '';
  String _cvc = '';

  @override
  void initState() {
    super.initState();
    _cardNumberController.addListener(_updateCardInfo);
    _cardholderNameController.addListener(_updateCardInfo);
    _expirationDateController.addListener(_updateCardInfo);
    _cvcController.addListener(_updateCardInfo);
  }

  @override
  void dispose() {
    _cardNumberController.removeListener(_updateCardInfo);
    _cardholderNameController.removeListener(_updateCardInfo);
    _expirationDateController.removeListener(_updateCardInfo);
    _cvcController.removeListener(_updateCardInfo);

    _cardNumberController.dispose();
    _cardholderNameController.dispose();
    _expirationDateController.dispose();
    _cvcController.dispose();
    super.dispose();
  }

  void _updateCardInfo() {
    setState(() {
      _cardNumber = _cardNumberController.text;
      _cardholderName = _cardholderNameController.text;
      _expirationDate = _expirationDateController.text;
      _cvc = _cvcController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Cards',
          style: TextStyle(color: Colors.white), // White title
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF7469B6), // Dark purple color
      ),
      body: Container(
        color: Color(0xFFFFD1DC), // Pastel pink background
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildPaymentCardExample1(),
              SizedBox(height: 16.0),
              Card(
                color: Color(0xFF7469B6), // Dark purple background for details
                elevation: 4.0,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildDetailRow('Card Number', _cardNumberController),
                      _buildDetailRow('Cardholder Name', _cardholderNameController),
                      _buildDetailRow('Expiration Date', _expirationDateController),
                      _buildDetailRow('CVC', _cvcController),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF7469B6), // Dark purple color
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                  ),
                  onPressed: _saveCardDetails,
                  child: Text(
                    'Save Card Details',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(color: Colors.white), // White text
          ),
          TextField(
            controller: controller,
            style: TextStyle(color: Colors.white), // White text
            decoration: InputDecoration(
              filled: true,
              fillColor: Color(0xFF7469B6), // Dark purple background
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPaymentCardExample1() {
    return PaymentCard(
      cardIssuerIcon: CardIcon(icon: Icons.credit_card),
      backgroundColor: Colors.blue,
      backgroundGradient: LinearGradient(
        colors: [Colors.purple, Colors.indigo],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      currency: Text('EUR'),
      cardNumber: _cardNumber.isEmpty ? '1234567890123456' : _cardNumber,
      validity: _expirationDate.isEmpty ? '10/24' : _expirationDate,
      holder: _cardholderName.isEmpty ? 'Jane Doe' : _cardholderName,
      isStrict: false,
      cardNetwork: CardNetwork.visa,
      cardTypeTextStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      cardNumberStyles: CardNumberStyles.darkStyle4,
      backgroundImage: null,
    );
  }

  void _saveCardDetails() {
    final card = CardModel(
      cardNumber: _cardNumber,
      cardholderName: _cardholderName,
      expirationDate: _expirationDate,
      cvc: _cvc,
    );

    final viewModel = CardViewModel();
    viewModel.saveCardDetails(card).then((_) {
      _showConfirmationDialog(context);
    });
  }

  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color(0xFF7469B6), // Dark purple background
          title: Text(
            'Confirmation',
            style: TextStyle(color: Colors.white),
          ),
          content: Text(
            'Card Details Saved!',
            style: TextStyle(color: Colors.white),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'OK',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}