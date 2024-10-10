class User {
  int? id;
  String username;
  String password;

  User({this.id, required this.username, required this.password});

  // to map
  Map<String, dynamic> toMap() {
    return {'id': id, 'username': username, 'password': password};
  }

  // form map
  factory User.formMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      username: map['username'],
      password: map['password'],
    );
  }
}
