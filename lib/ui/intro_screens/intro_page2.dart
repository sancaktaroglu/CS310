import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:untitled2/util/styles.dart';

class IntroPage2 extends StatelessWidget {
  const IntroPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const SizedBox(
        height: 50,
      ),
      Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
              child: Lottie.network('https://assets2.lottiefiles.com/packages/lf20_5xqvi8pf.json'),
          ),
      ),
      Text(
          "Get Directions to New Discoveries",
          style: onBoardingTextStyle,
      ),
    ],
    );
  }
}

