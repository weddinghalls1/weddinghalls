import 'package:flutter/material.dart';
import 'ForgetPassword.dart';
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

  void login() async {
    await viewModel.login(emailController.text.trim(), passwordController.text.trim());
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
                child: Image.asset(
                    "images/logo.png"
                ),
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
                    padding: const EdgeInsets.only(bottom: 50.0, left: 20, right: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Hello!",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Sign in",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),

                        SizedBox(height: 30),
                        TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                            //suffixIcon: Icon(Icons.check, color: Colors.grey),
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
                          obscureText: true,
                          decoration: InputDecoration(
                            //suffixIcon: Icon(Icons.visibility_off, color: Colors.grey),
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
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ForgetPassword()),
                              );
                            },
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
                            color: Color(0xffAD88C6),
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
                        SizedBox(height: 20),  // Reduced space
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Don't have account?",
                              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
                            ),
                            TextButton(
                              onPressed: () {
                                widget.onClickedSignUp();
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(builder: (context) => SignupPage()),
                                //);
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
  Widget _roleButton(String role) {
    return ElevatedButton(
      onPressed: () {
        // Define what happens when you tap the button
      },
      child: Text(role),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black, backgroundColor: Colors.purple[100],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
      ),
    );
  }
}