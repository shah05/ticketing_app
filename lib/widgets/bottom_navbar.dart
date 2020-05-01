import 'package:flutter/material.dart';
import 'package:ticketing_app/screens/home_screen.dart';
import 'package:ticketing_app/screens/settings_screen.dart';
import '../util/constants.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55.0,
      child: BottomAppBar(
        color: kAppBackgroundColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home, color: Colors.white),
              onPressed: () {
//                Navigator.push(
//                  context,
//                  MaterialPageRoute(
//                      builder: (context) => HomeScreen()),
//                );
              },
            ),
            IconButton(
              icon: Icon(Icons.account_box, color: Colors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SettingsScreen()),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
