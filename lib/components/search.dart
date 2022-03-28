import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 16.0),
        width: double.infinity,
        padding: const EdgeInsets.all(2.0),
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
        child: TextFormField(
          onChanged: (value) {},
          decoration: const InputDecoration(
              hintText: "Search restaurant or menu",
              suffixIcon: Icon(
                Icons.search,
                color: Colors.red,
              ),
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(left: 15, top: 15)),
        ));
  }
}
