import 'package:flutter/material.dart';
import 'package:restaurant_app/components/button.dart';
import 'package:restaurant_app/components/food_tile.dart';
import 'package:restaurant_app/pages/food_details_page.dart';
import 'package:restaurant_app/services/food_service.dart';
import 'package:restaurant_app/themes/colors.dart';
import 'package:restaurant_app/themes/fonts.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

List foodMenu = [
  Food(
      name: 'Ekmek Arası Kebap',
      price: '90',
      imagePath: 'lib/images/doner-kebab.png',
      rating: '4'),
  Food(
      name: 'Şiş Kebap',
      price: '120',
      imagePath: 'lib/images/sis-kebab.png',
      rating: '4'),
  Food(
      name: 'Dürüm Kebap',
      price: '90',
      imagePath: 'lib/images/kebab.png',
      rating: '4'),
  Food(
      name: 'Servis Kebap',
      price: '140',
      imagePath: 'lib/images/kebap.png',
      rating: '4'),
  Food(
      name: 'Menü Kebap',
      price: '160',
      imagePath: 'lib/images/logo.png',
      rating: '4'),
];
// navigate to food item details page

class _MenuPageState extends State<MenuPage> {
  void navigateToFoodDetails(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FoodDetailsPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(
          Icons.menu,
          color: Colors.grey[900],
        ),
        title: Container(
            padding: EdgeInsets.only(left: 70),
            child: Row(
              children: [
                Image.asset('lib/images/logo.png', cacheHeight: 25),
                Text(
                  'Kebab Man',
                  style: TextStyle(color: Colors.grey[900]),
                ),
              ],
            )),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //promo banner
                Container(
                    decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(20)),
                    margin: EdgeInsets.symmetric(horizontal: 30, vertical: 25),
                    padding: EdgeInsets.all(25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //promo message
                              Text(
                                'Get %32 Promo',
                                style: primaryTextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              //redeem button
                              MyButton(
                                text: 'Redeem',
                                onTap: () {},
                              )
                            ]),

                        // image
                        Image.asset(
                          'lib/images/kebap.png',
                          height: 100,
                        )
                      ],
                    )),
                //search bar
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search",
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                //menu list
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Text(
                      'Food Menu',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[800],
                          fontSize: 18),
                    )),
                const SizedBox(
                  height: 25,
                ),

                Expanded(
                    child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: foodMenu.length,
                  itemBuilder: (context, index) => FoodTile(
                    food: foodMenu[index],
                    onTap: () => navigateToFoodDetails(index),
                  ),
                )),

                const SizedBox(
                  height: 25,
                ),
                //popular food
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.grey[100]),
                  margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // image
                      Row(
                        children: [
                          Image.asset(
                            'lib/images/sis-kebab.png',
                            height: 60,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          // text
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Şiş Kebap",
                                style: primaryTextStyle(fontSize: 18),
                              ),
                              Text(
                                '\$120',
                                style: TextStyle(color: Colors.grey[700]),
                              ),
                            ],
                          ),
                        ],
                      ),
                      // favorite icon

                      Icon(Icons.favorite_border_outlined),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
