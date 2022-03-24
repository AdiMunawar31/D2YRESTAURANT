import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 24.0),
      width: double.infinity,
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
          border: Border.all(width: 0.3),
          borderRadius: const BorderRadius.all(Radius.circular(8.0))),
      child: Row(
        children: const [
          Icon(CupertinoIcons.search),
          SizedBox(width: 8.0),
          Text(
            'Search Restaurant...',
            style: TextStyle(color: Colors.grey, fontSize: 16.0),
          ),
        ],
      ),
    );
  }
}
