import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Welcome_Page.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  // Animation d'entrer
  void initState() {
    // TODO: implement initState
    super.initState();
    var future = Future.delayed(const Duration(seconds: 6), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => WelcomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo d'application
            Image.asset(
              'apah.png',
              height: 250,
            ),
            const SizedBox(
              height: 30,
            ),
            const CupertinoActivityIndicator(
              radius: 20,
            )
          ],
        ),
      ),
    );
  }
}
