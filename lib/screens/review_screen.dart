import 'package:d2yrestaurant/common/review_restaurant_list.dart';
import 'package:d2yrestaurant/data/api/detail_restaurant_api_service.dart';
import 'package:d2yrestaurant/data/models/detail_restaurant.dart';
import 'package:d2yrestaurant/provider/detail_restaurants_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReviewScreen extends StatelessWidget {
  static const routeName = '/review_screen';
  final Restaurant restaurant;
  const ReviewScreen({Key? key, required this.restaurant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 16.0),
                child: CircleAvatar(
                  backgroundColor: Colors.red,
                  child: IconButton(
                    icon: const Icon(
                      CupertinoIcons.back,
                      size: 24,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Reviews',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
              ),
              ChangeNotifierProvider<DetailRestaurantsProvider>(
                create: (_) => DetailRestaurantsProvider(
                    detailRestaurantApiService: DetailRestaurantApiService(),
                    id: restaurant.id),
                child: ReviewRestaurant(restaurant: restaurant),
              ),
              const SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
    );
  }
}
