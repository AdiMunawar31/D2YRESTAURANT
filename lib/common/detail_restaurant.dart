import 'package:d2yrestaurant/components/buttons.dart';
import 'package:d2yrestaurant/components/customer_review.dart';
import 'package:d2yrestaurant/components/detail_information.dart';
import 'package:d2yrestaurant/components/drink_list.dart';
import 'package:d2yrestaurant/components/food_list.dart';
import 'package:d2yrestaurant/components/heading.dart';
import 'package:d2yrestaurant/components/images.dart';
import 'package:d2yrestaurant/provider/detail_restaurants_provider.dart';
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
                  CustomerReviewList(restaurant: state.result.restaurant),
                  const MyButton()
                ],
              ),
            ),
          );
        } else if (state.state == ResultState.NoData) {
          return Center(child: Text(state.message));
        } else if (state.state == ResultState.Error) {
          return Center(child: Text(state.message));
        } else {
          return const Center(child: Text(''));
        }
      },
    );
  }
}
