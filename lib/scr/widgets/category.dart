import 'package:being_helpful/scr/models/category.dart';
import 'package:flutter/material.dart';

import '../helpers/styles.dart';
import 'custom_text.dart';

List<Category> categoriesList = [
  const Category(name:"Dual Pizza", image: "pizza_dual.jpeg"),
  const Category(name:"Bite it", image: "pizza_full_bite.jpeg"),
  const Category(name:"any store??", image: "pizza_store.jpeg"),
  const Category(name:"pizza bite", image: "pizza.jpeg"),
  const Category(name:"pizza store", image: "pizza_store_2.jpeg"),
  const Category(name:"restaurant", image: "pizza_store_3.jpeg"),
  const Category(name:"some food??", image: "pizza_with_coke.jpeg"),
];


class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // please change height of below two containers simultaneously

    return Container(
      height: 130,
      // width: 200,
      child: ListView.builder(
        itemCount: categoriesList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index){
          return Padding(
            padding: const EdgeInsets.all(3.0),

            child: Column(

              children: [
                Container(
                  height: 100,
                  decoration:
                  BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                        color: red[50]!, offset: const Offset(4, 6), blurRadius: 20),
                  ]),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Image.asset("images/${categoriesList[index].image}", width: 70,),
                  ),

                ),
                const SizedBox(height: 10,),
                CustomText(text: categoriesList[index].name, size: 12, color: grey,),
              ],
            ),
          );
        },
      ),
    );

  }
}
