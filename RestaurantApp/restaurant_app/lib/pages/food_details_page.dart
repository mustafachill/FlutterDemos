import 'package:flutter/material.dart';
import 'package:restaurant_app/components/food_tile.dart';
import 'package:restaurant_app/services/food_service.dart';
import 'package:restaurant_app/themes/colors.dart';
import 'package:restaurant_app/themes/fonts.dart';

class FoodDetailsPage extends StatefulWidget {
  Food food;
  FoodDetailsPage({super.key, required this.food});

  @override
  State<FoodDetailsPage> createState() => _FoodDetailsPageState();
}

class _FoodDetailsPageState extends State<FoodDetailsPage> {
  //quantity
  int quantityCount = 0;
  // decrement quantity
  void decrementQuantity() {
    setState(() {
      quantityCount--;
    });
  }

  // increasing quantity
  void increaseQuantity() {
    setState(() {
      quantityCount++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.grey[900],
      ),
      body: Container(
          child: Column(
        children: [
          // list view of foodtile
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: ListView(
                children: [
                  // image
                  Image.asset(
                    widget.food.imagePath,
                    height: 200,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  // rating
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow[800]),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        widget.food.rating,
                        style: TextStyle(
                            color: Colors.grey[600],
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  //food name
                  Text(
                    widget.food.name,
                    style: primaryTextStyle(
                      fontSize: 28,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  //description

                  Text("Description:",
                      style: TextStyle(fontSize: 18, color: Colors.grey[900])),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    widget.food.describe,
                    style: TextStyle(
                        fontSize: 14, color: Colors.grey[600], height: 2),
                  ),
                ],
              ),
            ),
          ),
          // price , stars, add to cart button
          Container(
            color: primaryColor,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  // price & quantity
                  Row(
                    children: [
                      // price
                      Text(
                        "\$" + widget.food.price,
                        style: primaryTextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      // quantity
                      Row(
                        children: [
                          //minus button
                          IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: decrementQuantity,
                          )
                          // quantity count

                          // plus button
                        ],
                      )
                    ],
                  ),
                  // add to cart button
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
