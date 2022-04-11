import 'package:d2yrestaurant/data/models/restaurant.dart';
import 'package:d2yrestaurant/provider/database_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SaveButton extends StatelessWidget {
  final Restaurant restaurant;

  const SaveButton({Key? key, required this.restaurant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DatabaseProvider>(
      builder: (context, provider, _) {
        return FutureBuilder<bool>(
          future: provider.isFavorited(restaurant.id),
          builder: (context, snapshot) {
            var isFavorited = snapshot.data ?? false;
            return CircleAvatar(
              backgroundColor: Colors.red,
              child: isFavorited
                  ? IconButton(
                      icon: const Icon(CupertinoIcons.heart_fill),
                      color: Colors.white,
                      onPressed: () => provider.removeFavorite(restaurant.id),
                    )
                  : IconButton(
                      icon: const Icon(CupertinoIcons.heart),
                      color: Colors.white,
                      onPressed: () => provider.addFavorite(restaurant),
                    ),
            );
          },
        );
      },
    );
  }
}
