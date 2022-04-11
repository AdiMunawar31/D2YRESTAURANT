import 'package:d2yrestaurant/containers/favorite_restaurant_list.dart';
import 'package:d2yrestaurant/provider/database_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatelessWidget {
  static const favoriteText = 'Favorite';

  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: const [
            Padding(
              padding: EdgeInsets.only(bottom: 8.0, top: 16.0),
              child: Text(
                'Favorite',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 16.0),
              child: Divider(color: Colors.grey),
            ),
            FavoriteRestaurantList(),
          ],
        ),
      ),
    );
  }
}
