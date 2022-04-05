import 'package:d2yrestaurant/components/buttons.dart';
import 'package:d2yrestaurant/components/customer_review.dart';
import 'package:d2yrestaurant/components/detail_information.dart';
import 'package:d2yrestaurant/components/drink_list.dart';
import 'package:d2yrestaurant/components/food_list.dart';
import 'package:d2yrestaurant/components/heading.dart';
import 'package:d2yrestaurant/components/images.dart';
import 'package:d2yrestaurant/helpers/state.dart';
import 'package:d2yrestaurant/provider/detail_restaurants_provider.dart';
import 'package:d2yrestaurant/screens/review_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailRestaurant extends StatelessWidget {
  const DetailRestaurant({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DetailRestaurantsProvider>(
      builder: (context, state, _) {
        if (state.state == ResultState.Loading) {
          return const Center(
            child: CircularProgressIndicator(
              strokeWidth: 6.0,
              semanticsLabel: 'Loading...',
              color: Colors.red,
            ),
          );
        } else if (state.state == ResultState.HasData) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Images(restaurant: state.result.restaurant),
                  DetailInformation(restaurant: state.result.restaurant),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Heading(name: 'Foods Menu'),
                  ),
                  FoodList(restaurants: state.result.restaurant),
                  const Padding(
                    padding:
                        EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
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
                  CustomerReviewFirst(restaurant: state.result.restaurant),
                  Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0,
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 0,
                            blurRadius: 4,
                            offset: const Offset(2, 2),
                          )
                        ],
                        border: Border.all(width: 0.1),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8.0))),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, ReviewScreen.routeName,
                            arguments: state.result.restaurant);
                      },
                      child: const Text(
                        'See All Reviews',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Divider(color: Colors.grey),
                  ),
                  const MyButton()
                ],
              ),
            ),
          );
        } else if (state.state == ResultState.NoData) {
          return Padding(
            padding: const EdgeInsets.only(top: 70.0, left: 30.0, right: 30.0),
            child: Center(
              child: Column(
                children: [
                  Image.asset('assets/images/error.png', height: 200),
                  const Text(
                    '404 DATA NOT FOUND!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  ),
                ],
              ),
            ),
          );
        } else if (state.state == ResultState.Error) {
          return Padding(
            padding: const EdgeInsets.only(top: 250.0, left: 30.0, right: 30.0),
            child: Center(
              child: Column(
                children: [
                  Image.asset('assets/images/error.png', height: 200),
                  const Text(
                    'Sorry, an error occurred in the connection!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
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
