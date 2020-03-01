import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ticketing_2/ticket_list_page.dart';
import 'package:ticketing_2/util/constants.dart';
import 'standard_card.dart';
import 'bottom_navbar.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(primaryColor: kAppBackgroundColor),
      home: new ListPage(title: 'Lessons'),
    );
  }
}

class ListPage extends StatelessWidget {
  ListPage({this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kAppBackgroundColor,
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: kAppBackgroundColor,
//    centerTitle: true,
        title: Text('Network Architect'),
      ),
      body: MenuListTile(),
      bottomNavigationBar: BottomNavBar(),
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
        StandardCard(
            cardName: 'New Tickets',
            cardDesc: 'Create & submit a new ticket',
            icon: FontAwesomeIcons.infoCircle,
//            onPress: (){
//              Navigator.push(
//                  context,
//                  MaterialPageRoute(
//                      builder: (context) => TicketListPage()));
//            }
            ),
        StandardCard(
            cardName: 'Track Tickets',
            cardDesc: 'Check status of your tickets',
            icon: FontAwesomeIcons.tasks,   onPress: (){
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => TicketListPage()));
        }),
        StandardCard(
            cardName: 'Equipment check',
            cardDesc: 'Get equipment details ',
            icon: FontAwesomeIcons.searchPlus)
      ],
    );
  }
}


