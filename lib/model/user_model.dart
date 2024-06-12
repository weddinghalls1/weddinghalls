class UserModel {
  final String email;
  final String profileImageUrl;
  final String fullName;

  UserModel({
    required this.email,
    required this.profileImageUrl,
    required this.fullName,

  });

  factory UserModel.fromMap(Map<String, dynamic> data) {
    return UserModel(
      email: data['email'] ??'',
      profileImageUrl: data['profileImageUrl']??'',
      fullName: data['fullName']??'',

    );
  }
}
