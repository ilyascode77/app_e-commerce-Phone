import 'package:flutter/material.dart';
import 'UserAcount.dart';

class AcountPage extends StatefulWidget {
  const AcountPage({Key? key}) : super(key: key);

  @override
  State<AcountPage> createState() => _AcountPageState();
}

class _AcountPageState extends State<AcountPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("My Account"),
        ),
        body: TabBarView(
          children: [
            DetaileUser(),
          ],
        ),
      ),
    );
  }
}
