import 'package:flutter/material.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:weddinghalls/views/signup_view.dart';
import '../view_model/signin_view_model.dart';

class SigninPage extends StatefulWidget {
  final VoidCallback onClickedSignUp;
  const SigninPage({required this.onClickedSignUp, Key? key}) : super(key: key);

  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final viewModel = SigninViewModel();
  String selectedCategory = '';
  bool _isPasswordVisible = false;

  void login() async {
    if (selectedCategory.isEmpty) {
      QuickAlert.show(
        context: context,
        type: QuickAlertType.error,
        title: 'Error',
        text: 'Please select a category before logging in',
      );
      return;
    }

    await viewModel.login(
      emailController.text.trim(),
      passwordController.text.trim(),
      selectedCategory,
      context,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Signin Page'),
        backgroundColor: Color(0xFFAD88C6),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 280,
              width: 448,
              decoration: const BoxDecoration(
                color: Color(0xffAD88C6),
              ),
              child: Padding(
                padding: EdgeInsets.only(bottom: 100, left: 7),
                child: Image.asset("images/logo.png"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 200.0),
              child: SingleChildScrollView(
                child: Container(
                  height: 667,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)),
                    color: Color(0xffFFE6E6),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 100, left: 20, right: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  selectedCategory = 'Celebratory';
                                });
                              },
                              child: Text(
                                "Celebratory",
                                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: selectedCategory == 'Celebratory'
                                    ? Color(0xffAD88C6)
                                    : Color(0xb3eed5ff),
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      bottomLeft: Radius.circular(10)
                                  ),
                                ),
                              ),
                            ),

                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  selectedCategory = 'HallOwner';
                                });
                              },
                              child: Text(
                                "Hall Owner",
                                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: selectedCategory == 'HallOwner'
                                    ? Color(0xffAD88C6)
                                    : Color(0xb3eed5ff),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0),
                                ),
                              ),
                            ),

                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  selectedCategory = 'Admin';
                                });
                              },
                              child: Text(
                                "Admin",
                                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: selectedCategory == 'Admin'
                                    ? Color(0xffAD88C6)
                                    : Color(0xb3eed5ff),
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10),
                                      bottomRight: Radius.circular(10)
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20,),
                        const Text(
                          "Hello!",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          "Sign in",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),

                        SizedBox(height: 30),
                        TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.mail),
                            labelText: 'Email',
                            labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Color(0xffAD88C6)),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Color(0xffAD88C6), width: 2),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Color(0xffAD88C6), width: 3),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextField(
                          controller: passwordController,
                          obscureText: !_isPasswordVisible,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isPasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isPasswordVisible =
                                  !_isPasswordVisible;
                                });
                              },
                            ),
                            labelText: 'Password',
                            labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Color(0xffAD88C6)),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Color(0xffAD88C6), width: 2),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Color(0xffAD88C6), width: 3),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextButton(
                            onPressed: () { },
                            child: const Align(
                              alignment: Alignment.centerRight,
                              child:  Text(
                                "Forget Password ?",
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color: Colors.black),
                              ),
                            )

                        ),
                        SizedBox(height: 70),
                        Container(
                          height: 55,
                          width: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Color(0xFF7469B6),
                          ),
                          child: InkWell(
                            onTap: () => login(),
                            child: const Center(
                              child: Text(
                                'SIGN IN',
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),  // Reduced space
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Don't have account?",
                              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignupPage(
                                      onClickedSignin: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ),
                                );
                              },
                              child: const Text(
                                "Sign up",
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color: Colors.black),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
