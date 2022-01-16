import 'package:being_helpful/scr/helpers/screen_navigation.dart';
import 'package:being_helpful/scr/helpers/styles.dart';
import 'package:being_helpful/scr/providers/auth.dart';
import 'package:being_helpful/scr/screens/shopping_bag.dart';
import 'package:being_helpful/scr/widgets/custom_bottom_nav_bar.dart';
import 'package:being_helpful/scr/widgets/category.dart';
import 'package:being_helpful/scr/widgets/custom_text.dart';
import 'package:being_helpful/scr/widgets/featured_products.dart';
import 'package:being_helpful/scr/widgets/popular_product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: white),
        backgroundColor: black,
        elevation: 0.1,
        title: const CustomText(
          text: 'Being Helpful',
          color: white,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                IconButton(
                    onPressed: () {
                      changeScreen(context, const ShoppingBag());
                    },
                    icon: const Icon(Icons.add_shopping_cart)),
                Positioned(
                  top: 12,
                  right: 6,
                  child: Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.notifications_none)),
                Positioned(
                  top: 12,
                  right: 12,
                  child: Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(20)),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      backgroundColor: white,
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
                decoration: const BoxDecoration(color: black),
                accountName: CustomText(
                  text: authProvider.userModel?.name ?? "undefined",
                  color: white,
                ),
                accountEmail: CustomText(
                  text: authProvider.userModel?.email ?? "undefined",
                  color: white,
                )),
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.home),
              title: const CustomText(
                text: 'Home',
              ),
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.people_alt_outlined),
              title: const CustomText(
                text: 'Peoples',
              ),
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.work),
              title: const CustomText(
                text: 'Works',
              ),
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.attach_money),
              title: const CustomText(
                text: 'Donation',
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: black,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20)),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 10.0, right: 8, left: 8, bottom: 16),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const []),
                  child: const ListTile(
                    leading: Icon(Icons.search, color: red),
                    title: TextField(
                      decoration: InputDecoration(
                          hintText: "Find Food or Services",
                          border: InputBorder.none),
                    ),
                    trailing: Icon(Icons.filter_list, color: red),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Categories(),
            const SizedBox(
              height: 5,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: CustomText(
                text: 'Featured',
                size: 20,
                color: grey,
              ),
            ),
            FeaturedProduct(),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: CustomText(
                text: 'Popular',
                color: grey,
                size: 20,
              ),
            ),
            const PopularProduct(),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}
