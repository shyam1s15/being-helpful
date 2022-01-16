import 'package:being_helpful/scr/helpers/screen_navigation.dart';
import 'package:being_helpful/scr/models/product.dart';
import 'package:being_helpful/scr/screens/details.dart';
import 'package:flutter/material.dart';

import '../helpers/styles.dart';
import 'custom_text.dart';

class FeaturedProduct extends StatelessWidget {
  FeaturedProduct({Key? key}) : super(key: key);
  
  List<Product> productList = [
    Product(name: 'Pizza', image: 'pizza.jpeg', rating: 4.2, vendor: 'Alli rest', wishList: false, price: 200),
    Product(name: 'Pizza dual', image: 'pizza_dual.jpeg', rating: 4.7, vendor: 'Baba Alli', wishList: true, price: 240),
    Product(name: 'full Pizza', image: 'pizza_full_bite.jpeg', rating: 4.5, vendor: "Kali's Pizza", wishList: false, price: 280),
    Product(name: 'Pizza store', image: 'pizza_store.jpeg', rating: 4.8, vendor: 'vekrange', wishList: true, price: 320),

  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: productList.length,
          itemBuilder: (_, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: (){
                  changeScreen(_, Details(product: productList[index]));
                },
                child: Container(
                  height: 260,
                  width: 200,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: red[50]!,
                            offset: Offset(4, 6),
                            blurRadius: 8),
                      ]),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Image.asset(
                        "images/${productList[index].image}",
                        height: 140,
                        width: 140,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CustomText(text: productList[index].name),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                  boxShadow: const [
                                    BoxShadow(
                                        color: grey,
                                        offset: Offset(1, 1),
                                        blurRadius: 8),
                                  ]),
                              child:  Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: productList[index].wishList ? Icon(
                                  Icons.favorite,
                                  color: red,
                                ) : Icon(Icons.favorite_border, color: red,),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children:  [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: CustomText(
                                  text: productList[index].rating.toString(),
                                  color: grey,
                                  size: 14,
                                ),
                              ),
                              Icon(
                                Icons.star,
                                color: red,
                                size: 16,
                              ),
                              Icon(
                                Icons.star,
                                color: red,
                                size: 16,
                              ),
                              Icon(
                                Icons.star,
                                color: red,
                                size: 16,
                              ),
                              Icon(
                                Icons.star,
                                color: red,
                                size: 16,
                              ),
                              Icon(
                                Icons.star,
                                color: grey,
                                size: 16,
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: CustomText(text: '\$${productList[index].price}', weight: FontWeight.bold,),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );

  }
}
