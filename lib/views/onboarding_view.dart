import 'package:flutter/material.dart';
import 'package:weddinghalls/view_model/onboarding_viewmodel.dart';
import 'signup_view.dart'; // استيراد شاشة التسجيل
import 'login_view.dart'; // استيراد شاشة تسجيل الدخول
import 'list_view.dart'; // استيراد شاشة قائمة العرض

class OnboardingView extends StatelessWidget {
  final OnboardingViewModel model = OnboardingViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFAD88C6), // لون الخلفية
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
                imageTextSpacing: 10.0, // مسافة 10 بكسل بين الصورة والنص
                textStyle: TextStyle(fontSize: 32, fontWeight: FontWeight.bold), // تكبير حجم الخط في الصفحة الأولى
              ),
              OnboardingPage(
                image: 'images/Onbording1.jpg',
                text: 'Beautiful and amazing places for wedding hall',
                buttonText: 'Continue',
                buttonAction: model.nextPage,
                imageTextSpacing: 30.0, // مسافة 30 بكسل بين الصورة والنص
              ),
              OnboardingPage(
                image: 'images/Onbording2.jpg',
                text: 'Let’s make your day special !',
                buttonText: 'Sign Up',
                buttonAction: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpView()),
                  );
                },
                imageTextSpacing: 30.0, // مسافة 30 بكسل بين الصورة والنص
                additionalButtons: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(200, 50), // زيادة حجم البوتون
                        backgroundColor: Color(0xFFFFE6E6),
                        side: BorderSide(color: Colors.black), // إطار أسود
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginView()),
                        );
                      },
                      child: Text('Log In', style: TextStyle(color: Colors.black)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(200, 50), // زيادة حجم البوتون
                        backgroundColor: Color(0xFFFFE6E6),
                        side: BorderSide(color: Colors.black), // إطار أسود
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ListViewPage()),
                        );
                      },
                      child: Text('Go To List', style: TextStyle(color: Colors.black)),
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
  final double imageTextSpacing; // مسافة بين الصورة والنص
  final TextStyle? textStyle; // نمط النص

  const OnboardingPage({
    required this.image,
    required this.text,
    required this.buttonText,
    required this.buttonAction,
    this.additionalButtons,
    this.imageTextSpacing = 30.0, // القيمة الافتراضية للمسافة هي 30 بكسل
    this.textStyle, // السماح بتحديد نمط النص كخيار
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(image),
        SizedBox(height: imageTextSpacing), // استخدام المسافة المحددة
        Text(
          text,
          style: textStyle ?? TextStyle(fontSize: 24, fontWeight: FontWeight.bold), // استخدام نمط النص المحدد
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 70), // إضافة مسافة قدرها 100 بكسل بين النص والزر
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: Size(200, 50), // زيادة حجم البوتون
            backgroundColor: Color(0xFFFFE6E6),
            side: BorderSide(color: Colors.black), // إطار أسود
          ),
          onPressed: buttonAction,
          child: Text(buttonText, style: TextStyle(color: Colors.black)),
        ),
        if (additionalButtons != null) ...additionalButtons!,
      ],
    );
  }
}
