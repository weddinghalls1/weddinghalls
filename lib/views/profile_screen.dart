import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../view_model/profile_view_model.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ProfileViewModel viewModel = ProfileViewModel();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController locationController = TextEditingController();

  String userId = 'n46Kwor3rjfFPQZErGQ4';
  String? userType;

  @override
  void initState() {
    super.initState();
    _loadUserType();
    viewModel.fetchUserData(userId).then((_) {
      if (mounted) {
        setState(() {
          emailController.text = viewModel.email ?? '';
          userNameController.text = viewModel.userName ?? '';
          locationController.text = viewModel.location ?? '';
        });
      }
    });
  }

  Future<void> _loadUserType() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userType = prefs.getString('userType');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile'),
        backgroundColor: Color(0xFF7469B6),
        elevation: 0,
      ),
      body: Container(
        color: Colors.pink[50],
        padding: EdgeInsets.all(20),
        child: ListView(
          children: <Widget>[
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.blue,
              child: Text(
                viewModel.userName?.substring(0, 1) ?? '',
                style: TextStyle(fontSize: 40, color: Colors.white),
              ),
            ),
            SizedBox(height: 20),
            inputField('Email Address', emailController, readOnly: true),
            SizedBox(height: 10),
            inputField('User Name', userNameController),
            SizedBox(height: 10),
            inputField('Location', locationController),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF7469B6)),
              onPressed: () async {
                try {
                  await viewModel.updateUserData(
                    userId,
                    userNameController.text,
                    locationController.text,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Profile updated successfully')),
                  );
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Failed to update profile: $e')),
                  );
                }
              },
              child: Text(
                'Save Changes',
                style: TextStyle(fontSize: 17, color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20),
            if (userType == 'user')
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF7469B6)),
                onPressed: () {
                  Navigator.of(context).pushNamed('/my_reservations');
                },
                child: Text(
                  'My Reservations',
                  style: TextStyle(fontSize: 17, color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            if (userType == 'admin')
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF7469B6)),
                onPressed: () {
                  Navigator.of(context).pushNamed('/halls');
                },
                child: Text('Halls',
                  style: TextStyle(fontSize: 17, color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            if (userType == 'hall_owner')
              Column(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF7469B6)),
                    onPressed: () {
                      Navigator.of(context).pushNamed('/adding_halls');
                    },
                    child: Text(
                      'Adding Halls',
                      style: TextStyle(fontSize: 17, color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF7469B6)),
                    onPressed: () {
                      Navigator.of(context).pushNamed('/my_halls');
                    },
                    child: Text(
                      'My Halls',
                      style: TextStyle(fontSize: 17, color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF7469B6)),
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/login');
              },
              child: Text(
                'Sign Out',
                style: TextStyle(fontSize: 17, color: Colors.black, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget inputField(String label, TextEditingController controller, {bool readOnly = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        readOnly: readOnly,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
