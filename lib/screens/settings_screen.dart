import 'dart:io';

import 'package:d2yrestaurant/provider/preferences_provider.dart';
import 'package:d2yrestaurant/provider/scheduling_provider.dart';
import 'package:d2yrestaurant/widgets/custom_dialog.dart';
import 'package:d2yrestaurant/widgets/snackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  static const settingsText = 'Settings';

  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<PreferencesProvider>(
        builder: (context, provider, child) {
          return SafeArea(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 8.0, top: 16.0),
                  child: Text(
                    'Settings',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Divider(color: Colors.grey),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  decoration: BoxDecoration(
                    border: Border.all(width: 0.5, color: Colors.grey),
                    borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                  ),
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
                        value: provider.isDarkTheme,
                        onChanged: (value) {
                          provider.enableDarkTheme(value);
                          if (value) {
                            snackBar(context, 'Dark Mode Activated!');
                          } else {
                            snackBar(context, 'Light Mode Activated!');
                          }
                        },
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  decoration: BoxDecoration(
                    border: Border.all(width: 0.5, color: Colors.grey),
                    borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                  ),
                  child: Material(
                    child: ListTile(
                      title: const Text(
                        'Restaurant Notification',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      subtitle: const Text(
                        'Enable Alarm Notification',
                        style: TextStyle(fontSize: 12),
                      ),
                      trailing: Consumer<SchedulingProvider>(
                        builder: (context, scheduled, _) {
                          return CupertinoSwitch(
                            value: provider.isDailyRestaurantActive,
                            onChanged: (value) async {
                              if (Platform.isIOS) {
                                customDialog(context);
                              } else {
                                scheduled.scheduleRestaurant(value);
                                provider.enableDailyRestaurant(value);

                                if (value) {
                                  snackBar(context, 'Enabled Alarm Notification!');
                                } else {
                                  snackBar(context, 'Disabled Alarm Notification!');
                                }
                              }
                            },
                          );
                        },
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
