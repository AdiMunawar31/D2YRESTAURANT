import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:d2yrestaurant/helpers/background_service.dart';
import 'package:d2yrestaurant/helpers/date_time_helper.dart';
import 'package:flutter/foundation.dart';

class SchedulingProvider extends ChangeNotifier {
  bool _isScheduling = false;

  bool get isScheduling => _isScheduling;

  Future<bool> scheduleRestaurant(bool value) async {
    _isScheduling = value;
    if (_isScheduling) {
      print('Scheduling Restaurant Activated!');
      notifyListeners();
      return await AndroidAlarmManager.periodic(
        const Duration(hours: 24),
        1,
        BackgroundService.callback,
        startAt: DateTimeHelper.format(),
        exact: true,
        wakeup: true,
      );
    } else {
      print('Scheduling News Canceled!');
      notifyListeners();
      return await AndroidAlarmManager.cancel(1);
    }
  }
}
