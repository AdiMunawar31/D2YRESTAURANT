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
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Text(
              'Search',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 16.0, left: 8.0, bottom: 8.0),
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 0,
                    blurRadius: 4,
                    offset: const Offset(2, 2),
                  )
                ],
                border: Border.all(width: 0.1),
                borderRadius: const BorderRadius.all(Radius.circular(8.0))),
            child: Material(
              child: ListTile(
                title: const Text(
                  'Set Dark Theme',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                subtitle: const Text(
                  'Change Theme',
                  style: TextStyle(fontSize: 12),
                ),
                trailing: CupertinoSwitch(
                  value: true,
                  onChanged: (value) {},
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
