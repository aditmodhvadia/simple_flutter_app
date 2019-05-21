class ErrorModel {
  String message;

  ErrorModel({this.message});

  Map<String, dynamic> toJson() =>
      {
        'message': message,
      };
}
