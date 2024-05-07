import 'package:firebase_database/firebase_database.dart';

class ProfileViewModel {
  final DatabaseReference _database = FirebaseDatabase.instance.reference();

  String? email;
  String? userName;
  String? location;

  Future<void> fetchUserData(String token) async {
    try {
      DatabaseEvent event = await _database.child('users')
          .orderByChild('token')
          .equalTo(token)
          .once();
      DataSnapshot snapshot = event.snapshot;
      if (snapshot.value != null) {
        var entry = (snapshot.value as Map).values
            .first;
        if (entry != null) {
          Map<String, dynamic> userData = Map<String, dynamic>.from(entry);
          email = userData['email'];
          userName = userData['userName'];
          location = userData['location'];
        }
      } else {
        print('No user found with token: $token');
      }
    } catch (e) {
      print('Error fetching user data: $e');
      throw e;
    }
  }

  Future<void> updateUserData(String userName, String location) async {
    String token = "hassan";
    DatabaseReference usersRef = FirebaseDatabase.instance.reference().child(
        'users');

    try {
      await usersRef.child(token).update({
        'userName': userName,
        'location': location,
        'email': email,
        'token': token
      });
      print('User data updated successfully');
    } catch (error) {
      print('Error updating user data: $error');
    }
  }
}