import 'package:flutter/material.dart';

import 'package:cs310/main.dart';
import 'package:cs310/util/colors.dart';
import 'package:cs310/util/styles.dart';
import 'package:cs310/util/dialog.dart';



class Profile_Edit extends StatefulWidget {
  const Profile_Edit({Key? key}) : super(key: key);

  @override
  State<Profile_Edit> createState() => _Profile_EditState();

  static const String routeName = "/profileEdit";
}

class _Profile_EditState extends State<Profile_Edit> {

  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 10,
        title: Text("Settings",
        style: HeadingTextStyle,),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 55,
              margin: EdgeInsets.symmetric(horizontal: 43),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(80),
                child: FlatButton(
                  color: AppColors.buttonColor,
                  onPressed: () {
                    Navigator.pushNamed(context, "/changePassword");
                  },
                  child: Text(
                    "Change Password",
                    style: WelcomeButtonTextStyle,
                  ),
                ),
              ),
            ),
            Container(
              height: 55,
              margin: EdgeInsets.symmetric(horizontal: 43),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(80),
                child: Container(
                  color: AppColors.buttonColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        child: Text(
                          "Private",
                          style: WelcomeButtonTextStyle,
                        ),
                      ),
                      Switch(
                          value: value,
                          onChanged: (check){
                            setState((){
                              value = check;
                      });
                      },
                      activeColor: Colors.black)
                    ],
                  ),
                )
            ),
            ),
            Container(
              height: 55,
              margin: EdgeInsets.symmetric(horizontal: 43),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(80),
                child: FlatButton(
                  color: AppColors.buttonColor,
                  onPressed: () {
                    showInfoDialog("Delete Account", "Are you sure you want to delete the account?", context);
                  },
                  child: Text(
                    "Delete Account",
                    style: WelcomeButtonTextStyle,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),


    );
  }
}
