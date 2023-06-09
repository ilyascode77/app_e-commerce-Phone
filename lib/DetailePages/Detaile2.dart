import 'package:flutter/material.dart';

import '../Widget/NavigatorBar.dart';

class Detail2 extends StatefulWidget {
  const Detail2({Key? key}) : super(key: key);

  @override
  State<Detail2> createState() => _Detail2State();
}

class _Detail2State extends State<Detail2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    color: Colors.blue[50], // Background color
                    child: Image.asset(
                      "images/food.png",
                      height: 500,
                    ),
                  ),
                  Positioned(
                    top: 10, // Adjust the top position as needed
                    left: 10, // Adjust the right position as needed
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => navigatorBar()));
                      },
                      child: Icon(
                        Icons.arrow_back_ios_outlined,
                        color: Colors.deepOrange,
                        size: 28,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text(
                  "Sandwtich",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0, left: 15),
                child: Text(
                  "A sandwich is a delicious and versatile food item that is loved by food enthusiasts worldwide. Our app offers a wide variety of sandwiches, each crafted with care and packed with flavor",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${60.toStringAsFixed(2)} MAD.',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.deepOrange,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      width: 100,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Add to Cart button logic
                      },
                      style: ElevatedButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.add_shopping_cart,
                            color: Colors.white,
                          ),
                          SizedBox(width: 5),
                          Text(
                            'Add to Cart',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
