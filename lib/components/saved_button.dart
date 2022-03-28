import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SaveButton extends StatefulWidget {
  const SaveButton({Key? key}) : super(key: key);

  @override
  State<SaveButton> createState() => _SaveButtonState();
}

class _SaveButtonState extends State<SaveButton> {
  bool isSaved = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return CircleAvatar(
      backgroundColor: screenWidth < 800 ? Colors.red : Colors.white,
      child: IconButton(
        icon: Icon(isSaved ? CupertinoIcons.heart_fill : CupertinoIcons.heart),
        color: screenWidth > 800 ? Colors.red : Colors.white,
        onPressed: () {
          setState(() {
            isSaved = !isSaved;
          });
        },
      ),
    );
  }
}
