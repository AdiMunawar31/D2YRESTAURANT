import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  static const settingsText = 'Settings';

  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 16.0),
            child: Text(
              'Search',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
          ),
          Material(
            child: ListTile(
              title: Text('Set Dark Theme'),
              subtitle: Text('Change Theme '),
              trailing: CupertinoSwitch(
                value: true,
                onChanged: (value) {},
              ),
            ),
          )
        ],
      ),
    ));
  }
}
