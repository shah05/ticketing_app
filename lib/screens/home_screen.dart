import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ticketing_app/screens/create_ticket/create_ticket_form_screen.dart';
import 'package:ticketing_app/screens/settings_screen.dart';
import 'package:ticketing_app/ui/views/create_ticket/select_contract_screen.dart';
import 'package:ticketing_app/util/constants.dart';
import 'package:ticketing_app/widgets/bottom_navbar.dart';
import 'package:ticketing_app/widgets/menu_card.dart';
import 'package:ticketing_app/widgets/ticket_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ticketing_app/screens/track_ticket/track_ticket_status_screen.dart';
import 'package:ticketing_app/widgets/top_banner.dart';

class HomeScreen extends StatelessWidget {
//  ListPage({this.title});
//  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kAppBackgroundColor,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            TopBanner(
              isBack: false,
            ),
            Expanded(
              child: MenuListTile(),
            ),
          ],
        ),
      ),
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
                      builder: (context) => SelectContractScreen()));
            }),
        MenuCard(
            cardName: 'Track Tickets',
            cardDesc: 'Check status of your tickets',
            icon: FontAwesomeIcons.tasks,
            onPress: () {
              Navigator.pushNamed(context, '/trackticket');
            }),
        MenuCard(
          cardName: 'Equipment check',
          cardDesc: 'Get equipment details',
          icon: FontAwesomeIcons.searchPlus,
          onPress: () {
            Navigator.pushNamed(context, '/equipment');
          },
        ),
//        MenuCard(
//            cardName: 'Settings',
//            cardDesc: 'Change account settings',
//            icon: FontAwesomeIcons.tasks,
//            onPress: () {
//              Navigator.pushNamed(context, '/settings');
//            }),
      ],
    );
  }
}
