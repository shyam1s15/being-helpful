import 'package:flutter/material.dart';

import '../custom_text.dart';

class BottomNavIcon extends StatelessWidget {
  const BottomNavIcon(
      {Key? key, required this.name, required this.icon, required this.onTap})
      : super(key: key);
  final String name;
  final IconData icon;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(icon, size: 30,),
            ),
            CustomText(text: name),
          ],
        ),
      ),
    );
  }
}
