
import 'package:being_helpful/scr/helpers/styles.dart';
import 'package:being_helpful/scr/models/product.dart';
import 'package:being_helpful/scr/widgets/custom_text.dart';
import 'package:being_helpful/scr/widgets/small_button.dart';
import 'package:flutter/material.dart';

class ShoppingBag extends StatefulWidget {
  const ShoppingBag({Key? key}) : super(key: key);

  @override
  State<ShoppingBag> createState() => _ShoppingBagState();
}

class _ShoppingBagState extends State<ShoppingBag> {
  Product product = Product(
      name: 'Super Pizza',
      price: 5.99,
      rating: 4.2,
      vendor: 'Dominozz',
      wishList: true,
      image: 'pizza_dual.jpeg');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: black),
        backgroundColor: white,
        elevation: 0,
        centerTitle: true,
        title: const CustomText(
          text: 'Shopping Bag',
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.shopping_bag),
                  color: black,
                ),
                Positioned(
                  right: 1,
                  bottom: 2,
                  child: Container(
                      decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                              color: grey, offset: Offset(2, 3), blurRadius: 3)
                        ],
                      ),
                      child: const Padding(
                        padding: EdgeInsets.only(left: 4, right: 4),
                        child: CustomText(
                          text: '2',
                          color: red,
                          weight: FontWeight.bold,
                        ),
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SafeArea(
          child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 120,
              decoration: BoxDecoration(
                color: white,
                boxShadow: [
                  BoxShadow(
                    color: red[50]!,
                    offset: const Offset(3, 5),
                    blurRadius: 20,
                  )
                ],
              ),
              child: Row(
                //TODO: make product name and price closer to image
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    "images/" + product.image,
                    height: 100,
                    width: 120,
                  ),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: product.name + '\n',
                        style: const TextStyle(
                            color: black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20)),
                    TextSpan(
                        text: '\$${product.price.toString()} \n',
                        style: const TextStyle(
                            color: black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18)),
                  ])),
                  IconButton(onPressed: (){}, icon: const Icon(Icons.delete)),
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
