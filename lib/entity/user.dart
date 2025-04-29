class User {
  final String username;
  final String email;
  final bool isActive;

  User(this.username, this.email, this.isActive);

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      json['username'] ?? '',
      json['email'] ?? '',
      json['isActive'] ?? '',
    );
  }
}
