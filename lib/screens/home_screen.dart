import 'package:d2yrestaurant/components/heading.dart';
import 'package:d2yrestaurant/components/restaurant_list.dart';
import 'package:d2yrestaurant/components/search.dart';
import 'package:d2yrestaurant/components/topbar.dart';
import 'package:d2yrestaurant/data/api/restaurant_api_service.dart';
import 'package:d2yrestaurant/provider/restaurants_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home_screen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const TopBar(),
                    const SearchBox(),
                    const Heading(name: 'Most Popular'),
                    ChangeNotifierProvider<RestaurantsProvider>(
                      create: (_) => RestaurantsProvider(
                          restaurantApiService: RestaurantApiService()),
                      child: const RestaurantList(),
                    )
                  ],
                ))));
  }
}
