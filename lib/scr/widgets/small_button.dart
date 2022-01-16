import 'package:being_helpful/scr/helpers/styles.dart';
import 'package:flutter/material.dart';

class SmallButton extends StatelessWidget {
  const SmallButton({Key? key,required this.icon}) : super(key: key);
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(color: red, borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Icon(
            icon,
            size: 16,
            color: white,
          ),
        ),
      ),
    );
  }
}
