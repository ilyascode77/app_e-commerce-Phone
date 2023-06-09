import 'package:flutter/material.dart';
import 'package:flutter_application_1/loginSingUp/LoginPage.dart';
import 'package:get/get.dart';

import 'loginSingUp/SignUp.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: Container(

            child: Image.asset('apah.png'),
          )),
          Expanded(
              child: Container(
            color: Colors.white,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Welcome to ESTK - FOOD",style: TextStyle(fontSize: 25,fontWeight:FontWeight.bold, color:Colors.deepOrange),),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Treat yourself to a delicious meal today. Order now and enjoy."),
                        Text("Make reservation in Real - Time."),

                        InkWell(
                          onTap: (){
                             Navigator.push(context, MaterialPageRoute(builder:(context)=>LoginPage() ));
                          },
                          child: Container(
                            height: 50,
                            width: 400,
                            decoration: BoxDecoration(
                              color: Colors.deepOrange,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child:Center(child: Text('Login',style: TextStyle(color: Colors.white,fontSize: 20),)),
                          ),
                        ),
                        SizedBox(height: 15,),
                        InkWell(
                          onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder:(context)=> SignUp() ));
                          },
                          child: Container(
                            height: 50,
                            width: 400,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.deepOrange),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child:Center(child: Text('Sign Up',style: TextStyle(color: Colors.deepOrange,fontSize: 20),)),
                          ),
                        ),

                      ],
                    )

                    ],
                  ),
                ),
          ))
        ],
      ),
    );
  }
}
