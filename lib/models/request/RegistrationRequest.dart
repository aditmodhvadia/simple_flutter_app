class RegistrationRequest {
  String name;
  String email;
  String password;

  RegistrationRequest({this.name, this.email, this.password});

  Map<String, dynamic> toJson() =>
      {
        'name': name,
        'email': email,
        'password': password,
      };
}
