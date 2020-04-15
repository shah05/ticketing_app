import 'package:flutter/material.dart';
import 'package:ticketing_app/main.dart';

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
          FlatButton(
            child: Text('Sign In'),
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
