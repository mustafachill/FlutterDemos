import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/components/button.dart';
import 'package:restaurant_app/models/shop.dart';
import 'package:restaurant_app/themes/colors.dart';
import 'package:restaurant_app/services/food_service.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

void removeFromCart(Food food, BuildContext context) {
  final shop = context.read<Shop>();

  shop.removeToCart(food);
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(
        builder: (context, value, child) => Scaffold(
              appBar: AppBar(
                foregroundColor: Colors.white,
                title: Text(
                  'My Cart',
                ),
                centerTitle: true,
                backgroundColor: primaryColor,
              ),
              body: Container(
                color: primaryColor,
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        color: primaryColor,
                        child: Expanded(
                          child: ListView.builder(
                            itemCount: value.cart.length,
                            itemBuilder: (context, index) {
                              // get food from cart
                              Food food = value.cart[index];
                              // get food name
                              String foodName = food.name;
                              // get food price
                              String foodPrice = food.price;
                              // return list tile
                              return Container(
                                margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                                decoration: BoxDecoration(
                                  color: secondaryColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: ListTile(
                                  title: Text(
                                    foodName,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Text(
                                    foodPrice,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  trailing: IconButton(
                                    icon:
                                        Icon(Icons.delete, color: Colors.white),
                                    onPressed: () {
                                      removeFromCart(food, context);
                                    },
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: MyButton(
                        text: 'Pay now',
                        onTap: () {},
                      ),
                    )
                  ],
                ),
              ),
            ));
  }
}
