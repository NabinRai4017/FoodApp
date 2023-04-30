class User {
  final int id;
  final String email, firstName, lastName, username;

  User({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.username,
  });

  factory User.fromJson(Map<String, dynamic> data) {
    final id = data['pk'] as int;
    final email = data['email'] as String;
    final firstName = data['first_name'] as String;
    final lastName = data['last_name'] as String;
    final username = data['username'] as String;
    return User(
        id: id,
        email: email,
        firstName: firstName,
        lastName: lastName,
        username: username);
  }

  @override
  String toString() {
    return 'User{id: $id, username: $username, email: $email, firstName: $firstName, lastName: $lastName}';
  }
}
