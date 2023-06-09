 
import 'package:flutter/material.dart';
 
import '../loginSingUp/SignUpModel.dart';

class Detail6 extends StatefulWidget {
  const Detail6({Key? key}) : super(key: key);

  @override
  State<Detail6> createState() => _Detail6State();
}

class _Detail6State extends State<Detail6> {
  Users user = Users(
      phone: 0, // Set the appropriate value for phone
      passwrd: '', // Set the appropriate value for passwrd
      loggedIn: true, // Set loggedIn to true for the logged-in user
      confpasswd: '',
      UserRole: '',
      Cin: '',
      Job: '',
      CNE: '',
      Sector: '', name: '', gmail: '',);
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
                      "images/Tacoos.png",
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
                  "Tacos",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0, left: 15),
                child: Text(
                  "Tacos are a popular Mexican dish that has gained widespread popularity and recognition around the world. They are a versatile and customizable food item, consisting of a tortilla filled with various ingredients, typically including meat, vegetables, cheese, and salsa..",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${50.toStringAsFixed(2)} MAD.',
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
                      onPressed: () {},
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
