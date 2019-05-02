import 'package:flutter/material.dart';
import 'package:simple_flutter_app/main.dart';
import 'package:simple_flutter_app/pages/login_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
//    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => SplashPage());
      case '/login':
//        if (args is String) {
        return MaterialPageRoute(builder: (_) => LoginPage());
//        }

//        return _errorRoute();

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('ERROR'),
        ),
        backgroundColor: Colors.red,
        body: Center(
            child: Text(
          'Error Occured',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 40),
        )),
      );
    });
  }
}
