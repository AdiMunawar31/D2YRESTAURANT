import 'package:d2yrestaurant/common/detail_restaurant.dart';
import 'package:d2yrestaurant/data/api/detail_restaurant_api_service.dart';
import 'package:d2yrestaurant/provider/detail_restaurants_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatelessWidget {
  static const routeName = '/detail_screen';
  final String id;

  const DetailScreen({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ChangeNotifierProvider<DetailRestaurantsProvider>(
      create: (_) => DetailRestaurantsProvider(
          detailRestaurantApiService: DetailRestaurantApiService(), id: id),
      child: const DetailRestaurant(),
    ));
  }
}
