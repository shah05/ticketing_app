import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ticketing_app/screens/create_ticket/create_ticket_form_screen.dart';
import 'package:ticketing_app/screens/create_ticket/select_contract_screen.dart';
import 'package:ticketing_app/screens/settings_screen.dart';
import 'package:ticketing_app/util/constants.dart';
import 'package:ticketing_app/widgets/bottom_navbar.dart';
import 'package:ticketing_app/widgets/menu_card.dart';
import 'package:ticketing_app/widgets/ticket_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ticketing_app/screens/track_ticket/track_ticket_status_screen.dart';

class HomeScreen extends StatelessWidget {
//  ListPage({this.title});
//  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kAppBackgroundColor,
//      appBar: AppBar(
//        automaticallyImplyLeading: false,
//        elevation: 0.1,
//        backgroundColor: kAppBarColor,
////    centerTitle: true,
//        title: Text(
//          'TIS Network Architect',
//          style: TextStyle(color: kTextTitle),
//        ),
//      ),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    height: 150.0,
                    color: Color(0xFFFCFC00),
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                  height: 80.0,
                                  width: 80.0,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                            'assets/network-architect-logo.png',
                                          ),
                                          fit: BoxFit.fill))
                                  ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Text(
                                    'Network Architects',
                                    style: TextStyle(
                                        color: Color(0xFF2B2DFE),
                                        fontSize: 30.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Warranty Included!',
                                    style: TextStyle(
                                      color: Color(0xFFF52700),
                                      fontWeight: FontWeight.bold
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Singapore-Kuala Lumpur',
                                style: TextStyle(
                                    color: Color(0xFFF52700),
                                    fontWeight: FontWeight.bold),
                              ),
                              Row(
                                children: <Widget>[
                                  Container(
                                      height: 40.0,
                                      width: 60.0,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                'assets/ukas-iso-logo.png',
                                              ),
                                              fit: BoxFit.fill))
//                                child: Image.asset('assets/ukas-iso-logo.png',),
//                                decoration: BoxDecoration(),
                                      ),
                                  Container(
                                      height: 40.0,
                                      width: 40.0,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                'assets/bizsafe-logo.png',
                                              ),
                                              fit: BoxFit.fill))
//                                child: Image.asset('assets/ukas-iso-logo.png',),
//                                decoration: BoxDecoration(),
                                      )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
//                    left: 10.0,
                    top: 0.0,
                    child: Icon(
                      Icons.arrow_back,
                      size: 30.0,
                    ),
                  ),
                ],
              ),
              Expanded(child: MenuListTile()),
            ],
          ),
        ));
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
        MenuCard(
            cardName: 'Settings',
            cardDesc: 'Change account settings',
            icon: FontAwesomeIcons.tasks,
            onPress: () {
              Navigator.pushNamed(context, '/settings');
            }),
      ],
    );
  }
}
