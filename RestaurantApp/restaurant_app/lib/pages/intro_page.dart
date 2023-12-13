import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant_app/components/button.dart';

final color = Color.fromARGB(255, 175, 57, 36);

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      body: Padding(
        padding: EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //shop name
            Container(
              padding: EdgeInsetsDirectional.only(start: 30),
              child: Row(children: [
                Padding(padding: EdgeInsets.only(left: 15)),
                Image.asset(
                  'lib/images/logo.png',
                  cacheHeight: 40,
                  cacheWidth: 40,
                ),
                Text(
                  "KEBAB MAN",
                  style: GoogleFonts.dmSerifDisplay(
                      fontSize: 40, color: Colors.white),
                ),
              ]),
            ),
            //icon
            Padding(
              padding: EdgeInsets.all(30),
              child: Image.asset('lib/images/kebap.png'),
            ),

            //title
            Text(
              "THE TASTE OF TRADITIONAL TURKISH MEAT",
              style:
                  GoogleFonts.dmSerifDisplay(fontSize: 27, color: Colors.white),
            ),
            //subtitle
            const Text(
              "Feel the taste of most famous Turkish food, kebab.",
              style: TextStyle(
                  color: Color.fromARGB(255, 212, 212, 212), height: 2),
            ),
            //get started button
            MyButton(
              text: 'Get Started',
              onTap: () {
                Navigator.pushNamed(context, '/menupage');
              },
            ),
          ],
        ),
      ),
    );
  }
}
