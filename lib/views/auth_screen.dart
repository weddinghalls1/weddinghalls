import 'package:flutter/material.dart';
import 'package:weddinghalls/views/signin_page.dart';
import 'package:weddinghalls/views/signup_view.dart';


class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isLogin = true;
  void toggleScreen(){
    setState(() {
      isLogin = !isLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLogin){
      return SigninPage(onClickedSignUp: toggleScreen);
    }else{
      return SignupPage(onClickedSignin: toggleScreen);
    }
  }
}
