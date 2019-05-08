import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:simple_flutter_app/api/NetworkManager.dart';
import 'package:simple_flutter_app/models/request/LoginRequest.dart';
import 'package:simple_flutter_app/models/response/LoginResponse.dart';

class ApiManager {
  static Future loginUser(LoginRequest request) async {
    String url = '${ApiURL.BASE_LOCAL}${ApiURL.AUTHENTICATE}';
    http.Response loginResponse = await NetworkManager.loginUser(
            {"Authorization": getAuthHeader(request.email, request.password)},
            url)
        .catchError((errMsg) {
      throw errMsg;
    });
//    TODO: Store token in-memory from here
    return LoginResponse.fromJson(jsonDecode(loginResponse.body));
  }

  static String getAuthHeader(String email, String password) {
    return 'Basic ' + base64Encode(utf8.encode('$email:$password'));
  }
}

class ApiURL {
  static const BASE_LOCAL = 'http://192.168.1.4:8080/api/v1/';

  static const AUTHENTICATE = 'authenticate';
}