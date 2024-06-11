import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';
import '../view_model/signup_viewmodel.dart';
import '../model/signup_model.dart';

class SignupPage extends StatefulWidget {
  final VoidCallback onClickedSignin;
  const SignupPage({required this.onClickedSignin, super.key});

  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  String selectedCategory = '';
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  final SignupViewModel _viewModel = SignupViewModel();

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  void _handleSignup() {
    final user = UserModel(
      fullName: fullNameController.text.trim(),
      phone: phoneController.text.trim(),
      email: emailController.text.trim(),
      category: selectedCategory,
    );
    _viewModel.signup(
      user,
      passwordController.text.trim(),
      confirmPasswordController.text.trim(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('Signup Page'),
        backgroundColor: Color(0xFFAD88C6),
      ),
      body: StreamBuilder<String?>(
        stream: _viewModel.errorStream,
        builder: (context, errorSnapshot) {
          if (errorSnapshot.hasData && errorSnapshot.data != null) {
            WidgetsBinding.instance!.addPostFrameCallback((_) {
              QuickAlert.show(
                context: context,
                type: QuickAlertType.error,
                text: errorSnapshot.data!,
              );
              _viewModel.clearError(); // Clear the error after showing it
            });
          }
          return SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  height: 280,
                  width: 448,
                  decoration: const BoxDecoration(
                    color: Color(0xffAD88C6),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 120, left: 7),
                    child: Image.asset("images/logo.png"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 170.0),
                  child: SingleChildScrollView(
                    child: Container(
                      height: screenHeight - 170,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40)),
                        color: Color(0xffFFE6E6),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            bottom: 80.0, left: 20, right: 20),
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
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: selectedCategory ==
                                        'Celebratory'
                                        ? Color(0xffAD88C6)
                                        : Color(0xb3eed5ff),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          bottomLeft: Radius.circular(10)),
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
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: selectedCategory ==
                                        'HallOwner'
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
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: selectedCategory == 'Admin'
                                        ? Color(0xffAD88C6)
                                        : Color(0xb3eed5ff),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(10),
                                          bottomRight: Radius.circular(10)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            Text(
                              "Create Your Account",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 20),
                            TextField(
                              controller: fullNameController,
                              decoration: InputDecoration(
                                labelText: 'Full Name',
                                labelStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xffAD88C6)),
                                prefixIcon: Icon(Icons.person),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: Color(0xffAD88C6), width: 2),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: Color(0xffAD88C6), width: 3),
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            TextField(
                              controller: phoneController,
                              decoration: InputDecoration(
                                labelText: 'Phone',
                                labelStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xffAD88C6)),
                                prefixIcon: Icon(Icons.phone),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: Color(0xffAD88C6), width: 2),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: Color(0xffAD88C6), width: 3),
                                ),
                              ),
                              keyboardType: TextInputType.number,
                            ),
                            SizedBox(height: 20),
                            TextField(
                              controller: emailController,
                              decoration: InputDecoration(
                                labelText: 'Email',
                                labelStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xffAD88C6)),
                                prefixIcon: Icon(Icons.mail),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: Color(0xffAD88C6), width: 2),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: Color(0xffAD88C6), width: 3),
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            TextField(
                              controller: passwordController,
                              obscureText: !_isPasswordVisible,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                labelStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xffAD88C6)),
                                prefixIcon: Icon(Icons.lock),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _isPasswordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _isPasswordVisible = !_isPasswordVisible;
                                    });
                                  },
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: Color(0xffAD88C6), width: 2),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: Color(0xffAD88C6), width: 3),
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            TextField(
                              controller: confirmPasswordController,
                              obscureText: !_isConfirmPasswordVisible,
                              decoration: InputDecoration(
                                labelText: 'Confirm Password',
                                labelStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xffAD88C6)),
                                prefixIcon: Icon(Icons.lock),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _isConfirmPasswordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _isConfirmPasswordVisible =
                                      !_isConfirmPasswordVisible;
                                    });
                                  },
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: Color(0xffAD88C6), width: 2),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: Color(0xffAD88C6), width: 3),
                                ),
                              ),
                            ),
                            SizedBox(height: 40),
                            StreamBuilder<bool>(
                              stream: _viewModel.loadingStream,
                              builder: (context, snapshot) {
                                if (snapshot.hasData && snapshot.data == true) {
                                  return CircularProgressIndicator();
                                } else {
                                  return Container(
                                    height: 55,
                                    width: 300,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: Color(0xFF7469B6),
                                    ),
                                    child: InkWell(
                                      onTap: _handleSignup,
                                      child: const Center(
                                        child: Text(
                                          'SIGN UP',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  );
                                }
                              },
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Already have an account?",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey),
                                ),
                                TextButton(
                                  onPressed: () {
                                    widget.onClickedSignin();
                                  },
                                  child: const Text(
                                    "Sign in",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17,
                                        color: Colors.black),
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
          );
        },
      ),
    );
  }
}
