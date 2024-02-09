class User {
  // Note: Storing passwords like this is not secure for real applications.

  User({
    required this.email,
    required this.password,
  });

  // Convert a Map into a User. The keys must correspond to the names of the
  // fields in the Hive box.
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }
  final String email;
  final String password;

  // Convert a User into a Map. The keys must correspond to the names of the
  // fields in the Hive box.
  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
    };
  }
}
