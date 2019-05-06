import 'package:flutter/material.dart';
import 'package:simple_flutter_app/custom_widgets/CustomAppBar.dart';
import 'package:simple_flutter_app/main.dart';
import 'package:simple_flutter_app/pages/login_page.dart';
import 'package:simple_flutter_app/pages/registration_page.dart';

class RouteGenerator {
  static const LOGIN_ROUTE = '/login';
  static const REGISTRATION_ROUTE = '/login/registration';
  static const SPLASH_ROUTE = '/';

  static Route<dynamic> generateRoute(RouteSettings settings) {
//    final args = settings.arguments;

    switch (settings.name) {
      case SPLASH_ROUTE:
        return MaterialPageRoute(builder: (_) => SplashPage());
      case LOGIN_ROUTE:
//        if (args is String) {
        return MaterialPageRoute(builder: (_) => LoginPage());
//        }

//        return _errorRoute();
      case REGISTRATION_ROUTE:
        return MaterialPageRoute(builder: (_) => RegistrationPage());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: CustomAppBar(
          title: 'ERROR',
          backgroundColor: Colors.amber,
        ),
        backgroundColor: Colors.red,
        body: Center(
            child: Text(
          'Error Occured',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 40),
        )),
      );
    });
  }
}
