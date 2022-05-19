import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroPage1 extends StatelessWidget {
  const IntroPage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const SizedBox(height: 50,),
      Padding(padding: EdgeInsets.all(16.0),child: Container(child: Lottie.network('https://assets1.lottiefiles.com/packages/lf20_z1ts6ce4.json'))),
      Text("Discover New Events and Places" ,style: TextStyle(
          color: Colors.grey[800],
          fontWeight: FontWeight.bold,
          fontSize: 25))
    ],
    );
  }
}