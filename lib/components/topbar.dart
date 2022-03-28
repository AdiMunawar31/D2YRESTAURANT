import 'package:d2yrestaurant/screens/search_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Icon(CupertinoIcons.line_horizontal_3_decrease, size: 32),
        IconButton(
          icon: const Icon(CupertinoIcons.search),
          onPressed: () {
            Navigator.pushNamed(context, SearchScreen.routeName);
          },
        )
      ],
    );
  }
}
