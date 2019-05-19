import 'dart:async';

import 'package:flutter/material.dart';

class AlertUtils {
  static const POSITIVE_CALLBACK = 'ACCEPT';
  static const NEGATIVE_CALLBACK = 'DECLINE';

  static Future<String> showSimpleDialog(
      {@required BuildContext context,
      String title,
      String message,
      var buttonColor = Colors.blue,
      @required String buttonText}) async {
    return showDialog<String>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: title != null
              ? Text(
                  title,
                  textAlign: TextAlign.center,
                )
              : Text(''),
          content: message != null
              ? SingleChildScrollView(
                  child: ListBody(
                    children: <Widget>[
                      Center(child: Text(message)),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: FlatButton(
                                color: buttonColor,
                                child: Text(
                                  buttonText,
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop(POSITIVE_CALLBACK);
                                },
                                shape: StadiumBorder(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              : null,
        );
      },
    );
  }

  static Future<String> showConfirmationDialog(
      {@required BuildContext context,
      String title,
      String message,
      @required String negativeButtonText,
      @required String positiveButtonText}) {
    return showDialog<String>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: title != null ? Text(title) : Text(''),
            content: message != null
                ? SingleChildScrollView(
                    child: ListBody(
                      children: <Widget>[
                        Center(child: Text(message)),
                        SizedBox(
                          height: 20,
                        ),
                        FlatButton(
                          child: Text(
                            negativeButtonText,
                            style: TextStyle(color: Colors.red),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop(NEGATIVE_CALLBACK);
                          },
                        ),
                        FlatButton(
                          shape: StadiumBorder(),
                          color: Colors.blue,
                          child: Text(
                            positiveButtonText,
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop(POSITIVE_CALLBACK);
                          },
                        ),
                      ],
                    ),
                  )
                : null,
          );
        });
  }
}
