import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroPage2 extends StatelessWidget {
  const IntroPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const SizedBox(height: 50,),
      Padding(padding: EdgeInsets.all(16.0),child: Container(child: Lottie.asset('89807-something-discovered-today.json'))),
      Text("Get Directions to New Discoveries",style: TextStyle(
          color: Colors.grey[800],
          fontWeight: FontWeight.bold,
          fontSize: 25))
    ],
    );
  }
}

