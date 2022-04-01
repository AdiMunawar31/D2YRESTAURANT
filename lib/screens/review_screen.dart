import 'package:d2yrestaurant/common/review_restaurant_list.dart';
import 'package:d2yrestaurant/data/api/detail_restaurant_api_service.dart';
import 'package:d2yrestaurant/data/models/detail_restaurant.dart';
import 'package:d2yrestaurant/provider/detail_restaurants_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReviewScreen extends StatefulWidget {
  static const routeName = '/review_screen';
  final Restaurant restaurant;
  const ReviewScreen({Key? key, required this.restaurant}) : super(key: key);

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  final _nameTextController = TextEditingController();
  final _reviewTextController = TextEditingController();

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
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Text(
                  'Reviews',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                padding: const EdgeInsets.all(16.0),
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8.0)),
                      ),
                      child: TextFormField(
                        textCapitalization: TextCapitalization.words,
                        controller: _nameTextController,
                        decoration: const InputDecoration(
                            hintText: "Name :",
                            suffixIcon: Icon(Icons.person),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(left: 10, top: 15)),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8.0)),
                      ),
                      child: TextFormField(
                        textCapitalization: TextCapitalization.sentences,
                        maxLines: 5,
                        controller: _reviewTextController,
                        decoration: const InputDecoration(
                            hintText: "Review :",
                            suffixIcon: Icon(Icons.rate_review),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(left: 10, top: 15)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, right: 4.0),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text('Send'),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 16.0),
              ChangeNotifierProvider<DetailRestaurantsProvider>(
                create: (_) => DetailRestaurantsProvider(
                    detailRestaurantApiService: DetailRestaurantApiService(),
                    id: widget.restaurant.id),
                child: ReviewRestaurant(restaurant: widget.restaurant),
              ),
              const SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
    );
  }
}
