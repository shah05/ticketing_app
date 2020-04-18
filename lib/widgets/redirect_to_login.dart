import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ticketing_app/main.dart';
import 'package:ticketing_app/util/constants.dart';

class RedirectToLogin extends StatelessWidget {
  const RedirectToLogin({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Access Expired..'),
          RaisedButton(
            color: kSubmitButton,
            child: Text('Sign In', style: TextStyle(color: kTextButton),),
            onPressed: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute<String>(
                    builder: (BuildContext context) => new MyApp(),
                    fullscreenDialog: true,
                  ));
            },
          ),
        ],
      ),
    );
  }
}
