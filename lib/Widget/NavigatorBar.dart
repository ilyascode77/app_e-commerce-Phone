import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/HomePage.dart';

class navigatorBar extends StatefulWidget {
  const navigatorBar({super.key});

  @override
  State<navigatorBar> createState() => _navigatorBarState();
}

class _navigatorBarState extends State<navigatorBar> {
  @override
  int index = 0;
  final screen = [
    HomePage(),
  ];
  Widget build(BuildContext context) {
    final items = [
      Icon(
        Icons.search,
        size: 30.0,
      ),
      Icon(
        Icons.shopping_cart,
        size: 30.0,
      ),
      Icon(
        Icons.home,
        size: 30.0,
      ),
      Icon(
        Icons.favorite,
        size: 30.0,
      ),
      Icon(
        Icons.person,
        size: 30.0,
      ),
    ];
    Size size = MediaQuery.of(context).size;
    var buttonColor = Color(0xFFFF9505);
    return Container(
      color: buttonColor,
      child: SafeArea(
        top: false,
        child: Scaffold(
          extendBody: true,
          backgroundColor: Colors.white,
          body: screen[index],
          bottomNavigationBar: Theme(
            data: Theme.of(context)
                .copyWith(iconTheme: IconThemeData(color: Colors.white)),
            child: CurvedNavigationBar(
              color: Colors.black45,
              backgroundColor: Colors.transparent,
              buttonBackgroundColor: buttonColor,
              height: 60.0,
              animationCurve: Curves.easeInOut,
              animationDuration: Duration(milliseconds: 400),
              index: index,
              items: items,
              onTap: (index) => setState(() => this.index = index),
            ),
          ),
        ),
      ),
    );
  }
}
