import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:http/http.dart' as http;
import 'package:simple_flutter_app/models/ErrorModel.dart';

class NetworkManager {
  bool isLoggingEnabled = false;

//  TODO: Add logging for all network calls if logging enabled

  static Future<http.Response> postWithHeader(
          {Object header, String url, Object body}) async =>
      Connectivity()
          .checkConnectivity()
          .then((ConnectivityResult result) async {
        if (result == ConnectivityResult.none) {
          print("Network not available");
          throw new ErrorModel(message: "Network not available");
        } else {
          final response = await http.post(url, headers: header, body: body);

          if (response.statusCode == HttpStatus.ok ||
              response.statusCode == HttpStatus.accepted) {
            return response;
          } else {
            throw new ErrorModel(message: response.body);
          }
        }
      }).catchError((error) {
        if (error is ErrorModel)
          throw error;
        else
          throw new ErrorModel(
              message: 'Some error occured. Please try again later!');
      });

  static String getAuthHeader(String email, String password) {
    return 'Basic ' + base64Encode(utf8.encode('$email:$password'));
  }
}
