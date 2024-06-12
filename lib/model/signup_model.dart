class UserModel {
  final String fullName;
  final String phone;
  final String email;
  final String category;

  UserModel({
    required this.fullName,
    required this.phone,
    required this.email,
    required this.category,
  });

  Map<String, dynamic> toMap() {
    return {
      'fullName': fullName,
      'phone': phone,
      'email': email,
      'category': category,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      fullName: map['fullName'],
      phone: map['phone'],
      email: map['email'],
      category: map['category'],
    );
  }
}
