import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';


class SignupPage extends StatefulWidget{
  final VoidCallback onClickedSignin;
  const SignupPage ({required this.onClickedSignin, super.key});

  State<SignupPage> createState()=> _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  Future signup() async {
    //QuickAlert.show(context: context, type: QuickAlertType.loading);
    if(isPasswordConfirmed()){
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
    }else{
      QuickAlert.show(context: context, type: QuickAlertType.error);
    }

  }
  bool isPasswordConfirmed(){
    if(confirmPasswordController.text.trim() ==
       passwordController.text.trim()){
      return true;
    }else{
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('Signup Page'),
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
              child:  Padding(
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
                  height: screenHeight - 200,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)),
                    color: Color(0xffFFE6E6),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 80.0, left: 20, right: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Create Your Account",
                          style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                        ),

                        SizedBox(height: 20),
                        TextField(
                          controller: fullNameController,
                          decoration: InputDecoration(
                            labelText: 'Full Name',
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
                          controller: phoneController,
                          decoration: InputDecoration(
                            labelText: 'Phone',
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
                          controller: emailController,
                          decoration: InputDecoration(
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
                        TextField(
                          controller: confirmPasswordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Confirm Password',
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
                        SizedBox(height: 40),
                        Container(
                          height: 55,
                          width: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Color(0xffAD88C6),
                          ),
                          child: InkWell(
                            onTap: () => signup(),
                            child: const Center(
                              child:  Text(
                                'SIGN UP',
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 25),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Already have an account?",
                              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
                            ),
                            TextButton(
                              onPressed: () {
                                widget.onClickedSignin();

                              },
                              child: const Text(
                                "Sign in",
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