import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


enum _SettingsTileType { simple, switchTile }

class SettingsTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget leading;
  final VoidCallback onTap;
  final Function(bool value) onToggle;
  final bool switchValue;
  final _SettingsTileType _tileType;

  const SettingsTile({
    Key key,
    @required this.title,
    this.subtitle,
    this.leading,
    this.onTap,
  })  : _tileType = _SettingsTileType.simple,
        onToggle = null,
        switchValue = null,
        super(key: key);

  const SettingsTile.switchTile({
    Key key,
    @required this.title,
    this.subtitle,
    this.leading,
    @required this.onToggle,
    @required this.switchValue,
  })  : _tileType = _SettingsTileType.switchTile,
        onTap = null,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle) : null,
      leading: leading,
      trailing: Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }

}