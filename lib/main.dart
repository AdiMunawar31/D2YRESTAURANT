import 'package:d2yrestaurant/data/api/restaurant_api_service.dart';
import 'package:d2yrestaurant/data/api/search_restaurant_api_service.dart';
import 'package:d2yrestaurant/provider/restaurants_provider.dart';
import 'package:d2yrestaurant/provider/search_restaurants_provider.dart';
import 'package:d2yrestaurant/screens/detail_screen.dart';
import 'package:d2yrestaurant/screens/home_screen.dart';
import 'package:d2yrestaurant/screens/layout_screen.dart';
import 'package:d2yrestaurant/screens/search_screen.dart';
import 'package:d2yrestaurant/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
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
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'D2Y RESTAURANT',
          theme: ThemeData(
              colorScheme: Theme.of(context).colorScheme.copyWith(
                    primary: Colors.red,
                  )),
          initialRoute: SplashScreen.routeName,
          routes: {
            SplashScreen.routeName: (context) => const SplashScreen(),
            LayoutScreen.routeName: (context) => const LayoutScreen(),
            HomeScreen.routeName: (context) => const HomeScreen(),
            DetailScreen.routeName: (context) => DetailScreen(id: ModalRoute.of(context)?.settings.arguments as String),
            SearchScreen.routeName: (context) => const SearchScreen(),
          }),
    );
  }
}
