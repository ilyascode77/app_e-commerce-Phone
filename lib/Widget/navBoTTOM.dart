import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/HomePage.dart';

class nav_Bott extends StatefulWidget {
  @override
  _nav_BottState createState() => _nav_BottState();
}

class _nav_BottState extends State<nav_Bott> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    final screens = [
      HomePage(),
      Container(),
      Container(),
      Container(),
    ];
    final items = <Widget>[
      Icon(Icons.home, size: 30),
      Icon(Icons.favorite_border, size: 30),
      Icon(Icons.shopping_cart_checkout, size: 30),
      Icon(Icons.person, size: 30),
    ];
    return Scaffold(
      extendBody: true,
      body: screens[index],
      bottomNavigationBar: Theme(
        data: Theme.of(context)
            .copyWith(iconTheme: IconThemeData(color: Colors.white)),
        child: CurvedNavigationBar(
          backgroundColor: Colors.transparent,
          color: Colors.deepOrange,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 300),
          height: 60,
          items: items,
          onTap: (newIndex) {
            setState(() {
              index = newIndex;
            });
          },
        ),
      ),
    );
  }
}
