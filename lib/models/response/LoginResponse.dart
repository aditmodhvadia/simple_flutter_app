class LoginResponse {
  String userEmail;
  String token;

  LoginResponse({this.userEmail, this.token});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      userEmail: json['message'],
      token: json['token'],
    );
  }
}
