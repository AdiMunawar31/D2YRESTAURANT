import 'dart:io';

import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:d2yrestaurant/common/navigation.dart';
import 'package:d2yrestaurant/data/api/restaurant_api_service.dart';
import 'package:d2yrestaurant/data/api/search_restaurant_api_service.dart';
import 'package:d2yrestaurant/data/db/database_helper.dart';
import 'package:d2yrestaurant/data/models/restaurant.dart';
import 'package:d2yrestaurant/data/preferences/preferences_helper.dart';
import 'package:d2yrestaurant/helpers/background_service.dart';
import 'package:d2yrestaurant/helpers/notification_helper.dart';
import 'package:d2yrestaurant/provider/database_provider.dart';
import 'package:d2yrestaurant/provider/preferences_provider.dart';
import 'package:d2yrestaurant/provider/restaurants_provider.dart';
import 'package:d2yrestaurant/provider/scheduling_provider.dart';
import 'package:d2yrestaurant/provider/search_restaurants_provider.dart';
import 'package:d2yrestaurant/screens/detail_screen.dart';
import 'package:d2yrestaurant/screens/home_screen.dart';
import 'package:d2yrestaurant/screens/layout_screen.dart';
import 'package:d2yrestaurant/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final NotificationHelper _notificationHelper = NotificationHelper();
  final BackgroundService _service = BackgroundService();

  _service.initializeIsolate();

  if (Platform.isAndroid) {
    await AndroidAlarmManager.initialize();
  }
  await _notificationHelper.initNotifications(flutterLocalNotificationsPlugin);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => RestaurantsProvider(restaurantApiService: RestaurantApiService()),
          ),
          ChangeNotifierProvider<SearchRestaurantsProvider>(
            create: (_) => SearchRestaurantsProvider(searchRestaurantApiService: SearchRestaurantApiService()),
          ),
          ChangeNotifierProvider(
            create: (_) => SchedulingProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => PreferencesProvider(
              preferencesHelper: PreferencesHelper(sharedPreferences: SharedPreferences.getInstance()),
            ),
          ),
          ChangeNotifierProvider(
            create: (_) => DatabaseProvider(databaseHelper: DatabaseHelper()),
          )
        ],
        child: Consumer<PreferencesProvider>(
          builder: (context, provider, child) {
            return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'D2Y RESTAURANT',
                theme: provider.themeData,
                navigatorKey: navigatorKey,
                initialRoute: SplashScreen.routeName,
                routes: {
                  SplashScreen.routeName: (context) => const SplashScreen(),
                  LayoutScreen.routeName: (context) => const LayoutScreen(),
                  HomeScreen.routeName: (context) => const HomeScreen(),
                  DetailScreen.routeName: (context) =>
                      DetailScreen(restaurant: ModalRoute.of(context)?.settings.arguments as Restaurant),
                });
          },
        ));
  }
}
