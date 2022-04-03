import 'package:d2yrestaurant/data/models/restaurant.dart';
import 'package:d2yrestaurant/helpers/state.dart';
import 'package:d2yrestaurant/provider/restaurants_provider.dart';
import 'package:d2yrestaurant/screens/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RestaurantList extends StatelessWidget {
  const RestaurantList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<RestaurantsProvider>(
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
          return SafeArea(
            child: ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: state.result.restaurants.length,
              itemBuilder: (context, index) {
                return _buildRestaurantsItem(
                    context, state.result.restaurants[index]);
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

Widget _buildRestaurantsItem(BuildContext context, Restaurant restaurant) {
  return InkWell(
      onTap: () {
        Navigator.pushNamed(context, DetailScreen.routeName,
            arguments: restaurant.id);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16.0),
        height: 90,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 0,
                blurRadius: 4,
                offset: const Offset(1, 1),
              )
            ],
            border: Border.all(width: 0.1),
            borderRadius: const BorderRadius.all(Radius.circular(8.0))),
        child: Row(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(left: 16),
              height: 70,
              width: 80,
              child: Hero(
                tag: restaurant.pictureId,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(4.0),
                    child: Image.network(
                      'https://restaurant-api.dicoding.dev/images/small/${restaurant.pictureId}',
                      fit: BoxFit.cover,
                    )),
              ),
            ),
            const SizedBox(
              width: 16.0,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    restaurant.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      const Icon(Icons.location_on,
                          color: Colors.red, size: 16),
                      Padding(
                        padding: const EdgeInsets.only(top: 2.0),
                        child: Text(
                          restaurant.city,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.red, size: 14),
                      Padding(
                        padding: const EdgeInsets.only(left: 2.0, top: 2.0),
                        child: Text(
                          '${restaurant.rating}',
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ));
}
