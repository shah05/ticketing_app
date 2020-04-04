import 'package:flutter/material.dart';
import 'package:ticketing_app/screens/settings_screen.dart';
import 'package:ticketing_app/util/constants.dart';
import 'package:ticketing_app/widgets/bottom_navbar.dart';
import 'package:ticketing_app/widgets/menu_card.dart';
import 'package:ticketing_app/widgets/ticket_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ticketing_app/screens/create_new_ticket_screen.dart';
import 'package:ticketing_app/screens/track_ticket_status_screen.dart';

class HomeScreen extends StatelessWidget {
//  ListPage({this.title});
//  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kAppBackgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.1,
        backgroundColor: kAppBackgroundColor,
//    centerTitle: true,
        title: Text('Network Architect'),
      ),
      body: MenuListTile(),
//      bottomNavigationBar: BottomNavBar(),
    );
  }
}

class MenuListTile extends StatelessWidget {
  const MenuListTile({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        MenuCard(
            cardName: 'New Tickets',
            cardDesc: 'Create & submit a new ticket',
            icon: FontAwesomeIcons.infoCircle,
            onPress: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CreateNewTicketScreen()));
            }),
        MenuCard(
            cardName: 'Track Tickets',
            cardDesc: 'Check status of your tickets',
            icon: FontAwesomeIcons.tasks,
            onPress: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TrackTicketStatusScreen()));
            }),
        MenuCard(
            cardName: 'Equipment check',
            cardDesc: 'Get equipment details ',
            icon: FontAwesomeIcons.searchPlus),
        MenuCard(
            cardName: 'Settings',
            cardDesc: 'Change account settings',
            icon: FontAwesomeIcons.tasks,
            onPress: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SettingsScreen()));
            }),
      ],
    );
  }
}
