import 'package:d2yrestaurant/data/models/detail_restaurant.dart';
import 'package:flutter/material.dart';

class DetailInformation extends StatelessWidget {
  final Restaurant restaurant;

  const DetailInformation({Key? key, required this.restaurant})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(restaurant.name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              )),
          const SizedBox(height: 8.0),
          Row(
            children: [
              const Icon(Icons.location_on, color: Colors.grey, size: 18),
              Padding(
                padding: const EdgeInsets.only(top: 2.0),
                child: Text(
                  restaurant.city,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8.0,
          ),
          Row(
            children: [
              const Icon(Icons.star, color: Colors.red, size: 20),
              Padding(
                padding: const EdgeInsets.only(left: 2.0, top: 2.0),
                child: Text(
                  '${restaurant.rating}',
                  style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Divider(color: Colors.grey),
          ),
          const Text('Description',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              )),
          const SizedBox(height: 8.0),
          Text(restaurant.description,
              style: TextStyle(fontSize: 16, color: Colors.grey[850])),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Divider(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
