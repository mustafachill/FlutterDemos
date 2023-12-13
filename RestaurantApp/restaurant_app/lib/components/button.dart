import 'package:flutter/material.dart';

final color = Color.fromARGB(255, 177, 80, 63);

class MyButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const MyButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(35)),
        child: Row(children: [
          Text(
            text,
            style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
          ),
          Padding(padding: EdgeInsets.only(right: 10)),
          Icon(
            Icons.arrow_forward,
            color: Colors.white,
          )
        ]),
      ),
    );
  }
}
