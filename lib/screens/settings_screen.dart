import 'package:flutter/material.dart';
import 'package:ticketing_app/util/constants.dart';
import 'package:ticketing_app/widgets/settings_list.dart';
import 'package:ticketing_app/widgets/settings_section.dart';
import 'package:ticketing_app/widgets/settings_tile.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool lockInBackground = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: TextStyle(color: kTextTitle),
        ),
        backgroundColor: kAppBarColor,
        iconTheme: IconThemeData(color: kIconTitle),
      ),
      body: SettingsList(
        sections: [
          SettingsSection(
            title: 'Account',
            tiles: [
              SettingsTile(
                  title: 'Phone number',
                  leading: Icon(
                    Icons.phone,
                    color: kIconBody,
                  )),
              SettingsTile(
                  title: 'Email', leading: Icon(Icons.email, color: kIconBody)),
              SettingsTile(
                  title: 'Sign out',
                  leading: Icon(Icons.exit_to_app, color: kIconBody)),
            ],
          ),
          SettingsSection(
            title: 'Miscellaneous',
            tiles: [
              SettingsTile(
                  title: 'Terms of Service',
                  leading: Icon(Icons.description, color: kIconBody)),
            ],
          )
        ],
      ),
    );
  }
}
