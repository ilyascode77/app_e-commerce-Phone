import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepOrange,
              ),
              accountName: Text(
                "User",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              accountEmail: Text(
                "rida@rida.com",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              currentAccountPicture: Icon(
                Icons.person,
                size: 80,
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              CupertinoIcons.home,
              color: Colors.deepOrange,
              size: 30,
            ),
            title: GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Container()));
              },
              child: Text(
                "Home",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              CupertinoIcons.person,
              color: Colors.deepOrange,
              size: 30,
            ),
            title: GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Container()));
              },
              child: Text(
                "My Account",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              CupertinoIcons.cart_fill,
              color: Colors.deepOrange,
              size: 30,
            ),
            title: GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Container()));
              },
              child: Text(
                "My orders",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              CupertinoIcons.heart_fill,
              color: Colors.deepOrange,
              size: 30,
            ),
            title: GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Container()));
              },
              child: Text(
                "My Wish List",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Divider(), // Ligne de séparation
          ListTile(
            leading: Icon(
              Icons.mail,
              color: Colors.deepOrange,
              size: 30,
            ),
            title: GestureDetector(
              onTap: () {
                // Ajoutez ici le code pour "Contactez-nous"
              },
              child: Text(
                "Contactez-nous",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          ListTile(
            leading: Image.asset(
              "assets/facebook_icon.png",
              color: Colors.deepOrange,
              width: 30,
              height: 30,
            ),
            title: GestureDetector(
              onTap: () {
                // Ajoutez ici le code pour le lien Facebook
              },
              child: Text(
                "Facebook",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          ListTile(
            leading: Image.asset(
              "assets/linkedin_icon.png",
              color: Colors.deepOrange,
              width: 30,
              height: 30,
            ),
            title: GestureDetector(
              onTap: () {
                // Ajoutez ici le code pour le lien LinkedIn
              },
              child: Text(
                "LinkedIn",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          ListTile(
            leading: Image.asset(
              "assets/instagram_icon.png",
              color: Colors.deepOrange,
              width: 30,
              height: 30,
            ),
            title: GestureDetector(
              onTap: () {
                // Ajoutez ici le code pour le lien Instagram
              },
              child: Text(
                "Instagram",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.exit_to_app,
              color: Colors.deepOrange,
              size: 30,
            ),
            title: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Text(
                "Log Out",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
