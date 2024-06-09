import 'package:flutter/material.dart';
import 'package:weddinghalls/views/ForgetPassword.dart';
import 'package:weddinghalls/views/forgot_password_view.dart';

class SettingsPage extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isDarkMode = false;
  double soundLevel = 50;
  double fontSize = 16;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[50],
        elevation: 0,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Settings',
              style: TextStyle(color: Colors.black),
            ),

          ],
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.pink[50],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(
                  'https://photographylife.com/cdn-cgi/imagedelivery/GrQZt6ZFhE4jsKqjDEtqRA/photographylife.com/2014/10/Nikon-D750-Sample-Image-33.jpg/w=960'), // Add your profile image URL here
              backgroundColor: Colors.transparent,
            ),
            const SizedBox(height: 10),
            const Text(
              'ahmad salam',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Divider(color: Colors.grey),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Account Settings',
                style: TextStyle(color: Colors.grey, fontSize: 20),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  EmailVerificationPage(),
                  ),
                );
              },
              child: const ListTile(
                title: Text(
                  'Change password',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ),
            const ListTile(
              title: Text(
                'new card',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: Icon(Icons.add),
            ),
            ListTile(
              title: const Text(
                'language',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: DropdownButton<String>(
                items: <String>['English', 'Spanish', 'French']
                    .map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (_) {},
              ),
            ),
            ListTile(
              title: const Text(
                'Dark mode',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: Switch(
                value: isDarkMode,
                inactiveThumbColor: Colors.white,
                onChanged: (bool value) {
                  setState(() {
                    isDarkMode = value;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text(
                'Sound',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Slider(
                value: soundLevel,
                activeColor: Colors.purple,
                min: 0,
                max: 100,
                onChanged: (double value) {
                  setState(() {
                    soundLevel = value;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text(
                'Font Size',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Slider(
                value: fontSize,
                activeColor: Colors.purple,
                min: 10,
                max: 30,
                onChanged: (double value) {
                  setState(() {
                    fontSize = value;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
