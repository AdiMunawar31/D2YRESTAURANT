import 'package:d2yrestaurant/components/saved_button.dart';
import 'package:d2yrestaurant/models/restaurant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Images extends StatelessWidget {
  final Restaurants restaurant;

  const Images({Key? key, required this.restaurant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Hero(
            tag: restaurant.pictureId,
            child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(16.0),
                    bottomRight: Radius.circular(16.0)),
                child: Image.network(restaurant.pictureId)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                child: IconButton(
                  icon: const Icon(
                    CupertinoIcons.back,
                    size: 24,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              // SaveButton()
              const SaveButton()
            ],
          ),
        ),
      ],
    );
  }
}
