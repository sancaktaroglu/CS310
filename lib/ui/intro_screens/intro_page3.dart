import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:untitled2/util/styles.dart';

class IntroPage3 extends StatelessWidget {
  const IntroPage3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
      const SizedBox(
          height: 95
      ),
      Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
              child: Lottie.network('https://assets2.lottiefiles.com/private_files/lf30_ac86ifrb.json'),
          ),
      ),
      Text(
          "Discuss Your Experience with People" ,
          style: onBoardingTextStyle2),
    ],
    );
  }
}
