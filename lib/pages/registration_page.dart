import 'package:flutter/material.dart';
import 'package:simple_flutter_app/custom_widgets/CustomAppBar.dart';

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

class __RegistrationFormState extends State<_RegistrationForm> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              keyboardType: TextInputType.text,
              decoration:
                  InputDecoration(hintText: 'John Doe', labelText: 'Name'),
//            validator: this._validateEmail,
//            onSaved: (String value) {
//              this._data.email = value;
//            },
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  hintText: 'you@example.com', labelText: 'E-Mail Address'),
//            validator: this._validateEmail,
//            onSaved: (String value) {
//              this._data.email = value;
//            },
            ),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                  hintText: 'Password', labelText: 'Enter your Password'),
//            validator: this._validatePassword,
//            onSaved: (String value) {
//              this._data.password = value;
//            },
            ),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                  hintText: 'Confirm Password',
                  labelText: 'Enter your Password again'),
//            validator: this._validatePassword,
//            onSaved: (String value) {
//              this._data.password = value;
//            },
            ),
            Container(
              width: double.infinity,
              child: MaterialButton(
                height: 45,
                padding: EdgeInsets.all(12),
//                onPressed: isLoading ? null : this.submit,
                onPressed: () {},
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
    );
  }
}
