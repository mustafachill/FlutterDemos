import 'package:flutter/material.dart';
import 'package:restaurant_app/components/button.dart';
import 'package:restaurant_app/themes/colors.dart';
import 'package:restaurant_app/themes/fonts.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
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
        child: Column(
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
                ))
            //search bar

            //menu list

            //popular food
          ],
        ),
      ),
    );
  }
}
