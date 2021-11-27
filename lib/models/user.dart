class User {
  late String name;
  late String email;
  late String password;

  User({
    required this.name,
    required this.email,
    required this.password,
  });

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "password": password,
    };
  }
}
