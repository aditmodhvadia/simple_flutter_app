import 'package:flutter/material.dart';
import 'package:simple_flutter_app/api/ApiManager.dart';
import 'package:simple_flutter_app/commons/AppUtils.dart';
import 'package:simple_flutter_app/custom_widgets/CustomAppBar.dart';
import 'package:simple_flutter_app/models/request/LoginRequest.dart';
import 'package:simple_flutter_app/models/response/LoginResponse.dart';
import 'package:simple_flutter_app/routes/route_generator.dart';

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

  void submit() async {
    setState(() {
      isLoading = true;
    });
    // First validate form.
    if (this._formKey.currentState.validate()) {
      _formKey.currentState.save(); // Save our form now.
      /*await new Future.delayed(
          const Duration(milliseconds: 2000),
          () => setState(() {
                isLoading = false;
              }));*/
      LoginRequest request = new LoginRequest(
        email: _data.email,
        password: _data.password,
      );
      await ApiManager.loginUser(request).then((LoginResponse response) {
        print('Printing the login data.');
//        print('Email from server: $response');
        print('Name from server: ${response.userName}');
        print('Email from server: ${response.userEmail}');
        print('Token from server: ${response.token}');
        Navigator.of(context).pushNamedAndRemoveUntil(
            RouteGenerator.DASHBOARD_ROUTE,
            ModalRoute.withName(RouteGenerator.SPLASH_ROUTE));
      }).catchError((error) {
        setState(() {
          print('loading false triggered');
          isLoading = false;
        });
//        TODO: Handle Errors from here
        print('Error=======> $error');
//        print('Error=======> ');
//        print('Error=======> ${jsonDecode(error)['message']}');
      });
    } else {
      setState(() {
        print('loading false triggered');
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
                initialValue: 'adit.modhvadia@gmail.com',
                decoration: InputDecoration(
                    hintText: 'you@example.com', labelText: 'E-Mail Address'),
                validator: AppUtils.validateEmail,
                onSaved: (String value) {
                  this._data.email = value;
                },
              ),
              TextFormField(
                initialValue: 'aditadit',
                obscureText: true,
                decoration: InputDecoration(
                    hintText: 'Password', labelText: 'Enter your Password'),
                validator: AppUtils.validatePassword,
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
                  onTap: () => Navigator.of(context)
                      .pushNamed(RouteGenerator.REGISTRATION_ROUTE),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
