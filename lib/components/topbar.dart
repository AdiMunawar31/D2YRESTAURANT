import 'package:flutter/cupertino.dart';

class TopBar extends StatelessWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Icon(CupertinoIcons.line_horizontal_3_decrease, size: 32),
        Text(
          'D2Y RESTAURANT',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Icon(CupertinoIcons.settings, size: 32),
      ],
    );
  }
}
