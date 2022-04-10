import 'package:d2yrestaurant/components/heading.dart';
import 'package:d2yrestaurant/containers/restaurant_list.dart';
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    // TopBar(),
                    Padding(
                      padding: EdgeInsets.only(top: 16.0, bottom: 4.0),
                      child: Text(
                        'D2Y RESTAURANT',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 24.0),
                      child: Text(
                        'Recomendations Restaurant for you!',
                        style: TextStyle(fontSize: 16, color: Colors.black54),
                      ),
                    ),
                    Heading(name: 'Most Popular'),
                    RestaurantList(),
                  ],
                ))));
  }
}
