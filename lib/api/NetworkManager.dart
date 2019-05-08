import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkManager {
  static Future<http.Response> loginUser(Object header, String url) async {
//    TODO: Check for internet connection and give alert accordingly
    final response = await http.post(url, headers: header);

    if (response.statusCode == 200) {
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
