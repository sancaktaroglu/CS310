import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroPage3 extends StatelessWidget {
  const IntroPage3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const SizedBox(height: 95),
      Padding(padding: EdgeInsets.all(16.0),child: Container(child: Lottie.asset('47600-discussions.json'))),
      Text("Discuss Your Experience with People" ,style: TextStyle(
          color: Colors.grey[800],
          fontWeight: FontWeight.bold,
          fontSize: 23))
    ],
    );
  }
}
