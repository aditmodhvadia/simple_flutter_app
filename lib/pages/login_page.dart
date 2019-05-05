import 'dart:async';

import 'package:flutter/material.dart';
import 'package:simple_flutter_app/custom_widgets/CustomAppBar.dart';
import 'package:simple_flutter_app/routes/route_generator.dart';
import 'package:validate/validate.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Login',
        backgroundColor: Colors.red,
      ),
      body: _LoginForm(),
    );
  }
}

class _LoginForm extends StatefulWidget {
  @override
  __LoginFormState createState() => __LoginFormState();
}

class _LoginData {
  String email = '';
  String password = '';
}

class __LoginFormState extends State<_LoginForm> {
  bool isLoading = false;
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  _LoginData _data = new _LoginData();

  String _validateEmail(String value) {
    try {
      Validate.isEmail(value);
    } catch (e) {
      return 'The E-mail Address must be a valid email address.';
    }
    return null;
  }

  String _validatePassword(String value) {
    if (value.length < 8) {
      return 'The Password must be at least 8 characters.';
    }
    return null;
  }

  void submit() async {
    setState(() {
      isLoading = true;
    });
    // First validate form.
    if (this._formKey.currentState.validate()) {
      _formKey.currentState.save(); // Save our form now.

      await new Future.delayed(
          const Duration(milliseconds: 2000),
          () => setState(() {
                isLoading = false;
              }));

      print('Printing the login data.');
      print('Email: ${_data.email}');
      print('Password: ${_data.password}');
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        key: _formKey,
        child: Center(
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    hintText: 'you@example.com', labelText: 'E-Mail Address'),
                validator: this._validateEmail,
                onSaved: (String value) {
                  this._data.email = value;
                },
              ),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                    hintText: 'Password', labelText: 'Enter your Password'),
                validator: this._validatePassword,
                onSaved: (String value) {
                  this._data.password = value;
                },
              ),
              Container(
                width: double.infinity,
                child: MaterialButton(
                  height: 45,
                  padding: EdgeInsets.all(12),
                  onPressed: isLoading ? null : this.submit,
                  child: isLoading
                      ? CircularProgressIndicator()
                      : Text(
                          'Login',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                  color: Colors.red,
                ),
                margin: EdgeInsets.only(top: 20),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: GestureDetector(
                  child: Text(
                    'Don\'t have an account? Sign up',
                    textAlign: TextAlign.center,
                  ),
                  onTap: () => Navigator.of(context).pushNamed(RouteGenerator.REGISTRATION_ROUTE),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
