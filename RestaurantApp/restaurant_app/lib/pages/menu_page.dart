import 'package:flutter/material.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
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
    );
  }
}
