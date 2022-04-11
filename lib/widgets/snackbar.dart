import 'package:flutter/material.dart';

snackBar(BuildContext context, String text) {
  final snackBar = SnackBar(
    content: Text(text),
    action: SnackBarAction(
      label: '',
      onPressed: () {},
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
