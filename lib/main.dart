import 'package:flutter/material.dart';
import 'package:ticketing_app/screens/create_new_ticket_screen.dart';
import 'package:ticketing_app/screens/equipment_check_screen.dart';
import 'package:ticketing_app/screens/home_screen.dart';
import 'package:ticketing_app/screens/login_screen.dart';
import 'package:ticketing_app/screens/settings_screen.dart';
import 'package:ticketing_app/screens/track_ticket_status_screen.dart';
import 'package:ticketing_app/util/constants.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Flutter Demo',
        theme: new ThemeData(
            primaryColor: kAppBackgroundColor),
        initialRoute: '/login',
        routes: <String, WidgetBuilder>{
          '/login': (context) => LoginScreen(),
          '/home': (context) => HomeScreen(),
          '/createticket': (context) => CreateNewTicketScreen(),
          '/trackticket': (context) => TrackTicketStatusScreen(),
          '/settings': (context) => SettingsScreen(),
          '/equipment': (context) => EquipmentCheckScreen(),
        });
  }
}
