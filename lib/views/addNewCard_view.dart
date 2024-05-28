import 'package:flutter/material.dart';

class AddCardPayment extends StatefulWidget {
  const AddCardPayment({super.key});

  @override
  State<AddCardPayment> createState() => _AddCardPaymentState();
}

class _AddCardPaymentState extends State<AddCardPayment> {
  String _selectedCardType = 'mastercard';

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
                onPressed: () {},
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
}
