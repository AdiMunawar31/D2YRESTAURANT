import 'package:d2yrestaurant/components/heading.dart';
import 'package:d2yrestaurant/components/restaurant_list.dart';
import 'package:d2yrestaurant/components/search.dart';
import 'package:d2yrestaurant/components/topbar.dart';
import 'package:flutter/material.dart';

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
                  children: const [
                    TopBar(),
                    SearchBox(),
                    Heading(name: 'Most Popular'),
                    RestaurantList()
                  ],
                ))));
  }
}
