import 'package:flutter/material.dart';

import 'package:untitled2/util/colors.dart';
import 'package:untitled2/util/styles.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 10,
        title: Text(
          "Welcome to Hot Pins",
          style: HeadingTextStyle,
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[AppColors.primary, AppColors.secondary],
              ),
          ),
        ),
      ),
      body: SafeArea(
          maintainBottomViewPadding: false,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 60, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Container(
                    height: 200,
                    margin: EdgeInsets.only(right: 50),
                    child: Image.network(
                      "http://assets.stickpng.com/images/58889201bc2fc2ef3a1860a7.png",
                    ),
                  ),
                ),
                SizedBox(height: 60),
                Container(
                  height: 55,
                  margin: EdgeInsets.symmetric(horizontal: 43),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(80),
                    child: FlatButton(
                      color: AppColors.buttonColor,
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      child: Text(
                        "Login",
                        style: WelcomeButtonTextStyle,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 35),
                Container(
                  height: 55,
                  margin: EdgeInsets.symmetric(horizontal: 43),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(80),
                    child: FlatButton(
                      color: AppColors.buttonColor,
                      onPressed: () {
                        Navigator.pushNamed(context, '/signup');
                      },
                      child: Text(
                        "Sign Up",
                        style: WelcomeButtonTextStyle,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 35),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(

                    height: 42,
                    child: FlatButton(onPressed: () {},
                      child: Image.network("https://cdn-icons-png.flaticon.com/512/2991/2991148.png",fit: BoxFit.fitHeight,),
                    ),
                  ),
                    Container(
                      height: 42,
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
