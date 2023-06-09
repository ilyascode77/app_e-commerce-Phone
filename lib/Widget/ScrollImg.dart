import 'package:flutter/material.dart';

class EnsImg extends StatelessWidget {
  const EnsImg({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          for (int i = 1; i < 4; i++)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'discount$i.png',
                  height: 200.0,
                  width: 400.0,
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                ),
              ),
            )
        ],
      ),
    );
  }
}
