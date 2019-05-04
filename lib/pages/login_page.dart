import 'package:flutter/material.dart';
import 'package:simple_flutter_app/custom_widgets/CustomAppBar.dart';
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

  void submit() {
    // First validate form.
    if (this._formKey.currentState.validate()) {
      _formKey.currentState.save(); // Save our form now.

      print('Printing the login data.');
      print('Email: ${_data.email}');
      print('Password: ${_data.password}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
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
                  onPressed: this.submit,
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.red,
                ),
                margin: EdgeInsets.only(top: 20),
              )
            ],
          ),
        ),
      ),
    );
  }
}
