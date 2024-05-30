import 'package:firebase_database/firebase_database.dart';

class ProfileViewModel {
  final DatabaseReference _database = FirebaseDatabase.instance.reference();

  String? email;
  String? userName;
  String? location;

  Future<void> fetchUserData(String token) async {
    try {
      DatabaseEvent event = await _database.child('users').orderByChild('token').equalTo(token).once();
      DataSnapshot snapshot = event.snapshot;
      if (snapshot.value != null) {
        // Assuming there is exactly one entry for each token
        var entry = (snapshot.value as Map).values.first;  // Access the first item of values
        if (entry != null) {
          Map<String, dynamic> userData = Map<String, dynamic>.from(entry);
          print(userData['email']);  // Should now properly print the email
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
    try {
      // This needs to be corrected as well to reference the right user node
      String token = 'hassan'; // Placeholder: Fetch or store the actual user ID somewhere
      await _database.child('users').child(token).update({
        'userName': userName,
        'location': location,
      });
      this.userName = userName;
      this.location = location;
    } catch (e) {
      print('Error updating user data: $e');
      throw e;
    }
  }
}
