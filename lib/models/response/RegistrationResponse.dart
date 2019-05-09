class RegistrationResponse {
  String message;

  RegistrationResponse({this.message});

  factory RegistrationResponse.fromJson(Map<String, dynamic> json) {
    return RegistrationResponse(
      message: json['message'],
    );
  }
}
