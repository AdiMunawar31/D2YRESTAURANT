import 'dart:convert';
import 'dart:math';

import 'package:d2yrestaurant/common/navigation.dart';
import 'package:d2yrestaurant/data/models/restaurant.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/rxdart.dart';

final selectNotificationSubject = BehaviorSubject<String>();

class NotificationHelper {
  static NotificationHelper? _instance;

  NotificationHelper._internal() {
    _instance = this;
  }

  factory NotificationHelper() => _instance ?? NotificationHelper._internal();

  Future<void> initNotifications(FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
    var initializationSettingsAndroid = const AndroidInitializationSettings('app_icon');

    var initializationSettinsIOS = const IOSInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );

    var initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettinsIOS,
    );

    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: (String? payload) async {
      if (payload != null) {
        print('Notification payload : $payload');
      }
      selectNotificationSubject.add(payload ?? 'Empty payload');
    });
  }

  Future<void> showNotification(
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin, RestaurantResult restaurants) async {
    var _channelId = '1';
    var _channelName = 'channel_01';
    var _channelDescription = 'd2yrestaurant channel';

    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      _channelId,
      _channelName,
      channelDescription: _channelDescription,
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
      styleInformation: const DefaultStyleInformation(true, true),
    );

    var iOSPlatformChannelSpesifics = const IOSNotificationDetails();

    var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpesifics,
    );

    var random = Random();
    var restaurantRandom = random.nextInt(restaurants.count);

    var titleNotification = '<b>D2Y RESTAURANT</b>';
    var titleRestaurant = restaurants.restaurants[restaurantRandom].name;

    var restaurantId = {"id": restaurants.restaurants[restaurantRandom].id};

    await flutterLocalNotificationsPlugin.show(
      0,
      titleNotification,
      titleRestaurant,
      platformChannelSpecifics,
      payload: json.encode(restaurantId),
    );
  }

  void configureSelectNotificationSubject(String routeName) {
    selectNotificationSubject.stream.listen((String payload) async {
      var restaurant = json.decode(payload);
      Navigation.intentWithData(routeName, restaurant['id']);
    });
  }
}
