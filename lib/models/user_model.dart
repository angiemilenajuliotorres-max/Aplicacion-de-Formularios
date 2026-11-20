class User {
  final String id;
  final String username;
  final String password;
  final String fullName;
  final String role;
  final String? profileImage;
  final String? bio;

  User({
    required this.id,
    required this.username,
    required this.password,
    required this.fullName,
    required this.role,
    this.profileImage,
    this.bio,
  });

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] ?? '',
      username: map['username'] ?? '',
      password: map['password'] ?? '',
      fullName: map['fullName'] ?? '',
      role: map['role'] ?? '',
      profileImage: map['profileImage'],
      bio: map['bio'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'password': password,
      'fullName': fullName,
      'role': role,
      'profileImage': profileImage,
      'bio': bio,
    };
  }
}
