import 'package:flutter/material.dart';
import 'package:restaurant_app/services/food_service.dart';
import 'package:restaurant_app/themes/fonts.dart';

class FoodTile extends StatelessWidget {
  final Food food;
  final void Function()? onTap;
  FoodTile({super.key, required this.food, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey[100],
        ),
        margin: EdgeInsets.only(
          left: 20,
        ),
        padding: EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //  image
            Image.asset(
              food.imagePath,
              height: 140,
            ),
            //  text
            Text(food.name, style: primaryTextStyle(fontSize: 20)),
            // price+rating
            SizedBox(
              width: 160,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //price
                  Text(
                    '\$' + food.price,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.grey[700]),
                  ),
                  //rating
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow[800],
                      ),
                      Text(
                        food.rating,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            )
      
            //
      
            //
          ],
        ),
      ),
    );
  }
}
