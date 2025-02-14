import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Widget/DrawerWidget.dart';
import 'package:flutter_application_1/Welcome_Page.dart';
import 'package:flutter_application_1/Widget/navBoTTOM.dart';
import 'package:flutter_application_1/composantes/Splash.dart';
import 'package:flutter_application_1/provider/my_provider.dart';
import 'package:flutter_application_1/src/HomePage.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers :[
        ChangeNotifierProvider(create: (_) => MyProvider()),
      ],
      child: MaterialApp(
        title: 'EstkFood',
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        home:HomePage(),
      ),
    );

  }
}
