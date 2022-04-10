import 'package:d2yrestaurant/data/models/detail_restaurant.dart';
import 'package:flutter/material.dart';

class DrinkList extends StatelessWidget {
  final Restaurant restaurants;

  const DrinkList({Key? key, required this.restaurants}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 8.0, bottom: 16.0),
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: restaurants.menus.drinks.length,
        itemBuilder: (context, index) {
          return _buildDrinkList(context, restaurants.menus.drinks[index]);
        },
      ),
    );
  }
}

Widget _buildDrinkList(BuildContext context, Category drink) {
  return InkWell(
    onTap: () {},
    child: Container(
      width: MediaQuery.of(context).size.width / 3,
      height: 120,
      margin: const EdgeInsets.all(4.0),
      decoration: BoxDecoration(
          border: Border.all(width: 0.5, color: Colors.grey),
          borderRadius: const BorderRadius.all(Radius.circular(8.0))),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              flex: 3,
              child: Container(
                  margin: const EdgeInsets.all(4.0),
                  height: 120,
                  width: 80,
                  child: Image.asset(
                    'assets/images/drink.png',
                    fit: BoxFit.cover,
                  )),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                child: Center(
                  child: Text(
                    drink.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}
