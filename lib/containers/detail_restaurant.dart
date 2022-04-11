import 'package:d2yrestaurant/common/navigation.dart';
import 'package:d2yrestaurant/components/buttons.dart';
import 'package:d2yrestaurant/components/customer_review.dart';
import 'package:d2yrestaurant/components/detail_information.dart';
import 'package:d2yrestaurant/components/drink_list.dart';
import 'package:d2yrestaurant/components/food_list.dart';
import 'package:d2yrestaurant/components/heading.dart';
import 'package:d2yrestaurant/components/saved_button.dart';
import 'package:d2yrestaurant/data/models/restaurant.dart';
import 'package:d2yrestaurant/helpers/state.dart';
import 'package:d2yrestaurant/provider/database_provider.dart';
import 'package:d2yrestaurant/provider/detail_restaurants_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailRestaurant extends StatelessWidget {
  final Restaurant restaurant;

  const DetailRestaurant({Key? key, required this.restaurant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DetailRestaurantsProvider>(
      builder: (context, state, _) {
        if (state.state == ResultState.loading) {
          return const Center(
            child: CircularProgressIndicator(
              strokeWidth: 6.0,
              semanticsLabel: 'Loading...',
              color: Colors.red,
            ),
          );
        } else if (state.state == ResultState.hasData) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Stack(
                    children: [
                      Center(
                        child: Hero(
                          tag: state.result.restaurant.pictureId,
                          child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(16.0), bottomRight: Radius.circular(16.0)),
                              child: Image.network(
                                  'https://restaurant-api.dicoding.dev/images/small/${state.result.restaurant.pictureId}')),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.red,
                              child: IconButton(
                                icon: const Icon(
                                  CupertinoIcons.back,
                                  size: 24,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  Navigation.back();
                                },
                              ),
                            ),
                            Consumer<DatabaseProvider>(
                              builder: (context, provider, _) {
                                return FutureBuilder<bool>(
                                  future: provider.isFavorited(restaurant.id),
                                  builder: (context, snapshot) {
                                    var isFavorited = snapshot.data ?? false;
                                    return CircleAvatar(
                                      backgroundColor: Colors.red,
                                      child: isFavorited
                                          ? IconButton(
                                              icon: const Icon(CupertinoIcons.heart_fill),
                                              color: Colors.white,
                                              onPressed: () => provider.removeFavorite(restaurant.id),
                                            )
                                          : IconButton(
                                              icon: const Icon(CupertinoIcons.heart),
                                              color: Colors.white,
                                              onPressed: () => provider.addFavorite(restaurant),
                                            ),
                                    );
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  DetailInformation(restaurant: state.result.restaurant),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Heading(name: 'Foods Menu'),
                  ),
                  FoodList(restaurants: state.result.restaurant),
                  const Padding(
                    padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
                    child: Heading(name: 'Drinks Menu'),
                  ),
                  DrinkList(restaurants: state.result.restaurant),
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text('Reviews',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  CustomerReviewList(restaurant: state.result.restaurant),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Divider(color: Colors.grey),
                  ),
                  const MyButton()
                ],
              ),
            ),
          );
        } else if (state.state == ResultState.noData) {
          return Padding(
            padding: const EdgeInsets.only(top: 70.0, left: 30.0, right: 30.0),
            child: Center(
              child: Column(
                children: [
                  Image.asset('assets/images/error.png', height: 200),
                  const Text(
                    '404 DATA NOT FOUND!',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.red),
                  ),
                ],
              ),
            ),
          );
        } else if (state.state == ResultState.error) {
          return Padding(
            padding: const EdgeInsets.only(top: 250.0, left: 30.0, right: 30.0),
            child: Center(
              child: Column(
                children: [
                  Image.asset('assets/images/error.png', height: 200),
                  const Text(
                    'Sorry, an error occurred in the connection!',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.red),
                  ),
                ],
              ),
            ),
          );
        } else {
          return const Center(child: Text(''));
        }
      },
    );
  }
}
