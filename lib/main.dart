import 'package:d2yrestaurant/data/models/detail_restaurant.dart';
import 'package:d2yrestaurant/screens/detail_screen.dart';
import 'package:d2yrestaurant/screens/home_screen.dart';
import 'package:d2yrestaurant/screens/review_screen.dart';
import 'package:d2yrestaurant/screens/search_screen.dart';
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
        theme: ThemeData(
            colorScheme: Theme.of(context).colorScheme.copyWith(
                  primary: Colors.red,
                )),
        initialRoute: SplashScreen.routeName,
        routes: {
          SplashScreen.routeName: (context) => const SplashScreen(),
          HomeScreen.routeName: (context) => const HomeScreen(),
          DetailScreen.routeName: (context) => DetailScreen(
              id: ModalRoute.of(context)?.settings.arguments as String),
          SearchScreen.routeName: (context) => const SearchScreen(),
          ReviewScreen.routeName: (context) => ReviewScreen(
              restaurant:
                  ModalRoute.of(context)?.settings.arguments as Restaurant)
        });
  }
}
