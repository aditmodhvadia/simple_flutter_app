class LoginResponse {
  String userName;
  String userEmail;
  String token;

  LoginResponse({this.userName, this.userEmail, this.token});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      userName: json['name'],
      userEmail: json['message'],
      token: json['token'],
    );
  }
}
