import 'package:d2yrestaurant/data/models/restaurant.dart';
import 'package:d2yrestaurant/screens/detail_screen.dart';
import 'package:d2yrestaurant/screens/home_screen.dart';
import 'package:d2yrestaurant/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'D2Y RESTAURANT',
        initialRoute: SplashScreen.routeName,
        routes: {
          SplashScreen.routeName: (context) => const SplashScreen(),
          HomeScreen.routeName: (context) => const HomeScreen(),
          DetailScreen.routeName: ((context) => DetailScreen(
              restaurant:
                  ModalRoute.of(context)?.settings.arguments as Restaurant))
        });
  }
}
