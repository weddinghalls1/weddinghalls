// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
// import '../../home_switch.dart';
// import 'Signup.dart';
// import 'Signin.dart';
//
// class WelcomeScreen extends StatelessWidget {
//   const WelcomeScreen ({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color(0xFFAD88C6),
//         toolbarHeight: 40,
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center, // Center the column
//           children: <Widget>[
//             ElevatedButton(
//               child: Text('Go To SignUp!'),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => SignupPage(onClickedSignin: () { },)),
//                 );
//               },
//             ),
//             SizedBox(height: 20), // Space between buttons
//             ElevatedButton(
//               child: Text('Go To Signin!'),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => HomeSwitch()),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//       backgroundColor: Color(0xFFAD88C6),
//     );
//   }
// }
