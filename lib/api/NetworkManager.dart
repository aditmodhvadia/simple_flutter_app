import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkManager {
  bool isLoggingEnabled = false;

//  TODO: Add logging for all network calls if logging enabled

  static Future<http.Response> postWithHeader(
      {Object header, String url, Object body}) async {
//    TODO: Check for internet connection and give alert accordingly
    final response = await http.post(url, headers: header, body: body);

    if (response.statusCode == 200 || response.statusCode == 201) {
      return response;
    } else {
      throw '${response.body}';
    }
  }

  static String getAuthHeader(String email, String password) {
    return 'Basic ' + base64Encode(utf8.encode('$email:$password'));
  }

//  TODO: Make a common class for error
}
