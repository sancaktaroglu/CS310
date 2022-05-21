import 'package:flutter/material.dart';

import 'package:untitled2/util/colors.dart';
import 'package:untitled2/util/styles.dart';
import 'package:untitled2/util/appBar.dart';
import 'package:untitled2/util/dimen.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: welcomeBar("Welcome to Hot Pins"),
      body: SafeArea(
          maintainBottomViewPadding: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Container(
                    height: SizeConfig.screenHeight/3,
                    margin: const EdgeInsets.only(right: 50),
                    child: Image.network(
                      "http://assets.stickpng.com/images/58889201bc2fc2ef3a1860a7.png",
                    ),
                  ),
                ),
                SizedBox(height: SizeConfig.screenHeight/15),
                Container(
                  height: SizeConfig.screenHeight/15,
                  margin: const EdgeInsets.symmetric(horizontal: 43),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(80),
                    child: FlatButton(
                      color: AppColors.buttonColor,
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      child: Text(
                        "Login",
                        style: welcomeButtonTextStyle,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: SizeConfig.screenHeight/20),
                Container(
                  height: SizeConfig.screenHeight/15,
                  margin: const EdgeInsets.symmetric(horizontal: 43),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(80),
                    child: FlatButton(
                      color: AppColors.buttonColor,
                      onPressed: () {
                        Navigator.pushNamed(context, '/signup');
                      },
                      child: Text(
                        "Sign Up",
                        style: welcomeButtonTextStyle,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: SizeConfig.screenHeight/20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                    height: SizeConfig.screenHeight/20,
                    child: FlatButton(onPressed: () {},
                      child: Image.network("https://cdn-icons-png.flaticon.com/512/2991/2991148.png",fit: BoxFit.fitHeight,),
                    ),
                  ),
                    SizedBox(
                      height: SizeConfig.screenHeight/20,
                      child: FlatButton(onPressed: () {},
                          child: Image.network("https://1000logos.net/wp-content/uploads/2016/10/Apple-Logo.png")),
                    ),],
                ),
              ],
            ),
          )),

    );
  }
}
