import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          showCupertinoDialog(
            context: context,
            builder: (context) {
              return CupertinoAlertDialog(
                title:
                    const Text('You have successfully booked this restaurant!'),
                actions: [
                  CupertinoDialogAction(
                    child: const Text('OK'),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              );
            },
          );
        },
        child: Container(
          margin: const EdgeInsets.all(16.0),
          alignment: Alignment.center,
          padding: const EdgeInsets.all(16.0),
          decoration: const BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.all(Radius.circular(8.0))),
          child: const Text(
            'Book Now',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ));
  }
}
