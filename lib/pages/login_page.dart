import 'package:flutter/material.dart';
import 'package:simple_flutter_app/custom_widgets/CustomAppBar.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Login',
        backgroundColor: Colors.red,
      ),
      body: Center(child: Text('Login Page')),
    );
  }
}
