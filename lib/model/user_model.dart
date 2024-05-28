class UserModel {
  final String email;
  final String profileImageUrl;
  final String username;
  final String token;

  UserModel({
    required this.email,
    required this.profileImageUrl,
    required this.username,
    required this.token,

  });

  factory UserModel.fromMap(Map<String, dynamic> data) {
    return UserModel(
      email: data['email'] ??'',
      profileImageUrl: data['profileImageUrl']??'',
      username: data['username']??'',
      token: data['token'] ?? '',

    );
  }
}
