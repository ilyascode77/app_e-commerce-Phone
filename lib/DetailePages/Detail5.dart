import 'package:flutter/material.dart';

import '../Widget/NavigatorBar.dart';
import '../loginSingUp/SignUpModel.dart';

class Detail5 extends StatefulWidget {
  const Detail5({Key? key}) : super(key: key);

  @override
  State<Detail5> createState() => _Detail5State();
}

class _Detail5State extends State<Detail5> {
  Users user = Users(
    phone: 0, // Set the appropriate value for phone
    passwrd: '', // Set the appropriate value for passwrd
    loggedIn: true, // Set loggedIn to true for the logged-in user
    confpasswd: '',
    UserRole: '',
    Cin: '',
    Job: '',
    CNE: '',
    Sector: '', name: '', gmail: '',
  );
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
                      "images/Taginee.png",
                      height: 500,
                    ),
                  ),
                  Positioned(
                    top: 10, // Adjust the top position as needed
                    left: 10, // Adjust the right position as needed
                    child: GestureDetector(
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => navigatorBar()));
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
                  "Tagine",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0, left: 15),
                child: Text(
                  "Tajine is more than just a meal—it's a cultural experience that has been passed down through generations. Our app is dedicated to bringing the authentic taste of Tajine to your table, offering a variety of tantalizing options to suit every palate.",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${100.toStringAsFixed(2)} MAD.',
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
