import 'package:being_helpful/scr/helpers/styles.dart';
import 'package:being_helpful/scr/models/product.dart';
import 'package:being_helpful/scr/widgets/custom_text.dart';
import 'package:being_helpful/scr/widgets/small_button.dart';
import 'package:carousel_pro_nullsafety/carousel_pro_nullsafety.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  const Details({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Column(
          children: [
            // carousel image
            Container(
              height: 300,
              child: Stack(
                children: [
                  Carousel(
                    autoplay: false,
                    dotBgColor: white,
                    dotColor: grey,
                    dotIncreasedColor: red,
                    dotIncreaseSize: 2,
                    images: [
                      Image.asset('images/${widget.product.image}'),
                      Image.asset('images/${widget.product.image}'),
                      Image.asset('images/${widget.product.image}'),
                      Image.asset('images/${widget.product.image}'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(
                                Icons.arrow_back_ios,
                                color: black,
                              )),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Stack(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.shopping_bag,
                                    color: black,
                                  )),
                              Positioned(
                                right: 1,
                                bottom: 2,
                                child: Container(
                                    decoration: BoxDecoration(
                                      color: white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: const [
                                        BoxShadow(
                                            color: grey,
                                            offset: Offset(2, 3),
                                            blurRadius: 3)
                                      ],
                                    ),
                                    child: const Padding(
                                      padding:
                                          EdgeInsets.only(left: 4, right: 4),
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
                      ),
                    ],
                  ),
                  const Positioned(
                      right: 14,
                      bottom: 14,
                      child: SmallButton(
                        icon: Icons.favorite,
                      ))
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: "${widget.product.name} \n",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            color: black)),
                    const TextSpan(
                        text: 'by ',
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 18,
                            color: grey)),
                    TextSpan(
                        text: widget.product.vendor + ' \n',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: black)),
                  ])),
                  CustomText(
                    text: "\$" + widget.product.price.toString(),
                    size: 18,
                    color: red,
                    weight: FontWeight.w400,
                  ),
                ],
              ),
            ),

            const SizedBox(
              height: 15,
            ),
            // plus minus bag
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      CupertinoIcons.minus,
                      color: red,
                    )),
                Container(
                    decoration: const BoxDecoration(color: red),
                    child: const Padding(
                      padding: EdgeInsets.fromLTRB(25, 8, 25, 8),
                      child: CustomText(
                        text: 'Add to Bag',
                        size: 20,
                        color: white,
                      ),
                    )),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      CupertinoIcons.plus,
                      color: red,
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
