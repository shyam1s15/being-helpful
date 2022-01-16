import 'package:being_helpful/scr/helpers/screen_navigation.dart';
import 'package:being_helpful/scr/providers/auth.dart';
import 'package:being_helpful/scr/screens/login.dart';
import 'package:being_helpful/scr/screens/shopping_bag.dart';
import 'package:being_helpful/scr/widgets/bottom_nav_bar/bottom_navigation_icon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../helpers/styles.dart';

class CustomBottomNavBar extends StatelessWidget {
  CustomBottomNavBar({Key? key}) : super(key: key);
  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Container(
      width: MediaQuery.of(context).size.width,
      height: 80,
      // color: white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BottomNavIcon(
            name: 'Home',
            icon: Icons.home_outlined,
            onTap: () {
              // print("Hellow");

            },
          ),
          BottomNavIcon(
            name: 'Peoples',
            icon: Icons.supervised_user_circle_outlined,
            onTap: () {
              // print("Hellow");


            },
          ),
          BottomNavIcon(
            name: 'Works',
            icon: Icons.shop_outlined,
            onTap: () {
              changeScreen(context, ShoppingBag());
            },
          ),
          BottomNavIcon(
            name: 'Donations',
            icon: Icons.attach_money_outlined,
            onTap: () async {
              await authProvider.signOut();
              authProvider.cleanController();
              changeScreen(context, LoginScreen());
            },
          ),
        ],
      ),
    );
  }
}
