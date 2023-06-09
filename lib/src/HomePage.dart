import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Widget/DrawerWidget.dart';
import 'package:flutter_application_1/Widget/NavigatorBar.dart';
import 'package:flutter_application_1/Widget/ScrollImg.dart';
import 'package:provider/provider.dart';
import '../Widget/AppBarWidget.dart';
import '../Widget/CategoriesWidget.dart';
import '../Widget/PopularWidget.dart';
import 'package:google_fonts/google_fonts.dart';

import '../model/categories_model.dart';
import '../provider/my_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {



  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      body: ListView(
        children: [
          // app bar
          AppBarWidget(),
          //Search
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 15,
            ),
            child: Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: Offset(0, 3),
                    )
                  ]),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Icon(
                      CupertinoIcons.search,
                      color: Colors.deepOrangeAccent,
                    ),
                    Container(
                      height: 50,
                      width: 300,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "What would you like have ?",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    Icon(
                      Icons.filter_list,
                      color: Colors.deepOrange,
                    ),
                  ],
                ),
              ),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            ),
          ),
          EnsImg(),
          SizedBox(
            height: 10,
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(left: 10),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 20,
                ),
                child: Text(
                  "Categories",
                  style: GoogleFonts.abhayaLibre(
                    fontSize: 20,
                    color: Color.fromARGB(255, 204, 125, 7),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  CategoriesWidget();
                },
                child: Text("See All",
                    style: GoogleFonts.acme(
                      color: Colors.deepOrange,
                      fontSize: 20,
                      height: 1,
                    )),
              ),
            ],
          ),

          //images

          //category Widget

          CategoriesWidget(),
          //populor plats

          Padding(
            padding: EdgeInsets.only(top: 20, left: 10),
            child: Text(
              "Popular",
              style: GoogleFonts.abhayaLibre(
                fontSize: 20,
                color: Color.fromARGB(255, 204, 125, 7),
              ),
            ),
          ),
          //  Populor Widget
          PopularWidget(),
        ],
      ),
    );
    navigatorBar();
  }
}
