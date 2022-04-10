import 'dart:isolate';
import 'dart:ui';
import 'package:d2yrestaurant/data/api/restaurant_api_service.dart';
import 'package:d2yrestaurant/helpers/notification_helper.dart';
import 'package:d2yrestaurant/main.dart';

final ReceivePort port = ReceivePort();

class BackgroundService {
  static BackgroundService? _instance;
  static const String _isolateName = 'isolate';
  static SendPort? _uiSendPort;

  BackgroundService._internal() {
    _instance = this;
  }

  factory BackgroundService() => _instance ?? BackgroundService._internal();

  void initializeIsolate() {
    IsolateNameServer.registerPortWithName(port.sendPort, _isolateName);
  }

  static Future<void> callback() async {
    print('Alarm Fired!');
    final NotificationHelper _notificationHelper = NotificationHelper();
    var restaurants = await RestaurantApiService().getRestaurantList();
    await _notificationHelper.showNotification(flutterLocalNotificationsPlugin, restaurants);

    _uiSendPort ??= IsolateNameServer.lookupPortByName(_isolateName);
    _uiSendPort?.send(null);
  }
}
