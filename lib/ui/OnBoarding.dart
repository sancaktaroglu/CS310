import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:untitled2/ui/intro_screens/intro_page1.dart';
import 'package:untitled2/ui/intro_screens/intro_page2.dart';
import 'package:untitled2/ui/intro_screens/intro_page3.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {

  PageController _controller = PageController();
  bool onLastPage = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: Container(
        color: Color(0xFFFF5722),
        child: Stack(
          children: [PageView(

            onPageChanged: (index) {
              setState(() {
                onLastPage = (index==2);
              });
            },
            controller: _controller,
            children: [
              IntroPage1(),
              IntroPage2(),
              IntroPage3()
            ],
          ),

          Container(child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(child: Text('Skip',style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 20)) , onTap: (){
                _controller.jumpToPage(2);
              },),
              SmoothPageIndicator(controller: _controller, count: 3, effect: SlideEffect(activeDotColor: Color(0xFFFFC107)),),
              onLastPage ? GestureDetector(child: Text('Get Started',style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 20)), onTap: () async{
                      final prefs = await SharedPreferences.getInstance();
                      prefs.setBool('showHome', true);
                      Navigator.pushNamedAndRemoveUntil(context, "/welcome", (route) => false);
                //Ana Page' e route eklencek
              },) : GestureDetector(child: Text('Next',style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 20)), onTap: (){
                _controller.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeIn);
              },)
            ],
          ),
          alignment: Alignment(0,0.75),)
        ],
        ),
      )),
    );

  }
}


