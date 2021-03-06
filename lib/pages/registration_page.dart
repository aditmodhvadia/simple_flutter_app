import 'package:flutter/material.dart';
import 'package:simple_flutter_app/api/ApiManager.dart';
import 'package:simple_flutter_app/commons/AlertUtils.dart';
import 'package:simple_flutter_app/commons/AppUtils.dart';
import 'package:simple_flutter_app/custom_widgets/CustomAppBar.dart';
import 'package:simple_flutter_app/models/ErrorModel.dart';
import 'package:simple_flutter_app/models/request/RegistrationRequest.dart';
import 'package:simple_flutter_app/models/response/RegistrationResponse.dart';
import 'package:simple_flutter_app/routes/route_generator.dart';

class RegistrationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Registration',
        backgroundColor: Colors.green,
      ),
      body: _RegistrationForm(),
    );
  }
}

class _RegistrationForm extends StatefulWidget {
  @override
  __RegistrationFormState createState() => __RegistrationFormState();
}

class _RegistrationData {
  String name = '';
  String email = '';
  String password = '';
//  String name ='';
}

class __RegistrationFormState extends State<_RegistrationForm> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final GlobalKey<FormFieldState> _passKey = GlobalKey<FormFieldState>();
  _RegistrationData _data = new _RegistrationData();
  bool isLoading = false;

  void submit() async {
    setState(() {
      isLoading = true;
    });
    // First validate form.
    if (this._formKey.currentState.validate()) {
      _formKey.currentState.save(); // Save our form now.

      RegistrationRequest request = new RegistrationRequest(
        name: _data.name,
        email: _data.email,
        password: _data.password,
      );

      await ApiManager.registerUser(request)
          .then((RegistrationResponse response) async {
        setState(() {
          isLoading = false;
        });
        print('Printing the registration data.');
        print('Message from server: ${response.message}');
        String callback = await AlertUtils.showSimpleDialog(
          context: context,
          title: 'Registration Successful!',
          message: 'Please login to continue',
          buttonText: 'Okay',
        );
        if (callback == AlertUtils.POSITIVE_CALLBACK) {
          print('Callback received');
          Navigator.of(context).pushNamedAndRemoveUntil(
              RouteGenerator.LOGIN_ROUTE,
              ModalRoute.withName(RouteGenerator.SPLASH_ROUTE));
        }
      }).catchError((error) async {
        ErrorModel model = error;
        setState(() {
          print('loading false triggered');
          isLoading = false;
        });
        print('Error=======> $model');
        await AlertUtils.showSimpleDialog(
            context: context,
            buttonText: 'Okay',
            title: 'Error occurred',
//          message: jsonDecode(error)['message'],
            message: model.message,
            buttonColor: Colors.red);
//        print('Error=======> ');
//        print('Error=======> ${jsonDecode(error)['message']}');
      });

      print('Printing the login data.');
      print('Name: ${_data.name}');
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
                keyboardType: TextInputType.text,
                decoration:
                    InputDecoration(hintText: 'John Doe', labelText: 'Name'),
                validator: AppUtils.validateName,
                onSaved: (String value) {
                  this._data.name = value;
                },
                initialValue: 'Adit Modhvadia',
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    hintText: 'you@example.com', labelText: 'E-Mail Address'),
                validator: AppUtils.validateEmail,
                onSaved: (String value) {
                  this._data.email = value;
                },
                initialValue: 'adit.modhvadia@gmail.com',
              ),
              TextFormField(
                key: _passKey,
                obscureText: true,
                decoration: InputDecoration(
                    hintText: 'Password', labelText: 'Enter your Password'),
                validator: AppUtils.validatePassword,
                onSaved: (String value) {
                  this._data.password = value;
                },
                initialValue: 'aditadit',
              ),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                    hintText: 'Confirm Password',
                    labelText: 'Enter your Password again'),
                validator: (value) => AppUtils.validateConfirmPassword(
                      value,
                      _passKey.currentState.value,
                    ),
                initialValue: 'aditadit',
              ),
              Container(
                width: double.infinity,
                child: MaterialButton(
                  height: 45,
                  padding: EdgeInsets.all(12),
                  onPressed: isLoading ? null : this.submit,
//                  onPressed: this.submit,
                  child: isLoading
                      ? CircularProgressIndicator()
                      : Text(
                          'Register',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                  color: Colors.green,
                ),
                margin: EdgeInsets.only(top: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
