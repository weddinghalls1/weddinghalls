import 'package:flutter/material.dart';
import 'package:weddinghalls/view_model/onboarding_viewmodel.dart';
import 'package:weddinghalls/views/signin_page.dart';

import 'Signup.dart';
import 'home_screen.dart';


class OnboardingView extends StatelessWidget {
  final OnboardingViewModel model = OnboardingViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFAD88C6),
      body: ValueListenableBuilder<int>(
        valueListenable: model.currentPage,
        builder: (context, currentPage, child) {
          return PageView(
            controller: model.pageController,
            onPageChanged: model.onPageChanged,
            children: <Widget>[
              OnboardingPage(
                image: 'images/logo.png',
                text: '  Wedding Halls ',
                buttonText: 'Continue ',
                buttonAction: model.nextPage,
                imageTextSpacing: 10.0,
                textStyle: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              OnboardingPage(
                image: 'images/Onbording1.jpg',
                text: 'Beautiful and amazing places for wedding hall',
                buttonText: 'Continue',
                buttonAction: model.nextPage,
                imageTextSpacing: 30.0, //
              ),
              OnboardingPage(
                image: 'images/Onbording2.jpg',
                text: 'Let’s make your day special !',
                buttonText: 'Sign Up',
                buttonAction: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignupPage(onClickedSignin: () {  },)),
                  );
                },
                imageTextSpacing: 30.0,
                additionalButtons: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(200, 50),
                        backgroundColor: Color(0xFFFFE6E6),
                        side: BorderSide(color: Colors.black),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SigninPage(onClickedSignUp: () {  },)),
                        );
                      },
                      child: Text('Log In', style: TextStyle(color: Colors.black)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(200, 50),
                        backgroundColor: Color(0xFFFFE6E6),
                        side: BorderSide(color: Colors.black),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomeScreen()),
                        );
                      },
                      child: Text('Go To Home', style: TextStyle(color: Colors.black)),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String image;
  final String text;
  final String buttonText;
  final VoidCallback buttonAction;
  final List<Widget>? additionalButtons;
  final double imageTextSpacing;
  final TextStyle? textStyle;

  const OnboardingPage({
    required this.image,
    required this.text,
    required this.buttonText,
    required this.buttonAction,
    this.additionalButtons,
    this.imageTextSpacing = 30.0,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(image),
        SizedBox(height: imageTextSpacing),
        Text(
          text,
          style: textStyle ?? TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 70),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: Size(200, 50),
            backgroundColor: Color(0xFFFFE6E6),
            side: BorderSide(color: Colors.black),
          ),
          onPressed: buttonAction,
          child: Text(buttonText, style: TextStyle(color: Colors.black)),
        ),
        if (additionalButtons != null) ...additionalButtons!,
      ],
    );
  }
}
