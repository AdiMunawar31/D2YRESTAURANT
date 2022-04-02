import 'package:d2yrestaurant/data/models/detail_restaurant.dart';
import 'package:d2yrestaurant/helpers/state.dart';
import 'package:d2yrestaurant/provider/detail_restaurants_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReviewRestaurant extends StatelessWidget {
  final Restaurant restaurant;

  const ReviewRestaurant({Key? key, required this.restaurant})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DetailRestaurantsProvider>(
      builder: (context, state, _) {
        if (state.state == ResultState.Loading) {
          return const Padding(
            padding: EdgeInsets.only(top: 150.0),
            child: Center(
              child: CircularProgressIndicator(
                strokeWidth: 6.0,
                semanticsLabel: 'Loading...',
                color: Colors.red,
              ),
            ),
          );
        } else if (state.state == ResultState.HasData) {
          return Container(
            padding: const EdgeInsets.only(left: 8.0),
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: restaurant.customerReviews.length,
              itemBuilder: (context, index) {
                return _buildReview(context, restaurant.customerReviews[index]);
              },
            ),
          );
        } else if (state.state == ResultState.NoData) {
          return Padding(
            padding: const EdgeInsets.only(top: 150.0),
            child: Center(
                child: Text(
              state.message,
              style: const TextStyle(
                  fontSize: 24, fontWeight: FontWeight.bold, color: Colors.red),
            )),
          );
        } else if (state.state == ResultState.Error) {
          return Padding(
            padding: const EdgeInsets.only(top: 70.0, left: 30.0, right: 30.0),
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

Widget _buildReview(BuildContext context, CustomerReview review) {
  return Container(
    margin: const EdgeInsets.only(right: 16.0, left: 8.0, bottom: 8.0),
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
        borderRadius: const BorderRadius.all(Radius.circular(8.0))),
    child: Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                  margin: const EdgeInsets.all(4.0),
                  height: 50,
                  width: 50,
                  child: Image.asset(
                    'assets/images/avatar.png',
                    fit: BoxFit.cover,
                  )),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      review.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      review.date!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Divider(color: Colors.grey),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(review.review),
          )
        ],
      ),
    ),
  );
}
