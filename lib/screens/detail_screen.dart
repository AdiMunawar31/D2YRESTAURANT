import 'package:d2yrestaurant/components/buttons.dart';
import 'package:d2yrestaurant/components/detail_information.dart';
import 'package:d2yrestaurant/components/drink_list.dart';
import 'package:d2yrestaurant/components/food_list.dart';
import 'package:d2yrestaurant/components/heading.dart';
import 'package:d2yrestaurant/components/images.dart';
import 'package:d2yrestaurant/models/restaurant.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  static const routeName = '/detail_screen';
  final Restaurants restaurant;

  const DetailScreen({Key? key, required this.restaurant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Images(restaurant: restaurant),
              DetailInformation(restaurant: restaurant),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Heading(name: 'Foods Menu'),
              ),
              FoodList(restaurants: restaurant),
              const Padding(
                padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
                child: Heading(name: 'Drinks Menu'),
              ),
              DrinkList(restaurants: restaurant),
              const MyButton()
            ],
          ),
        ),
      ),
    );
  }
}
