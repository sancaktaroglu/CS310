import 'package:flutter/material.dart';
import 'package:untitled2/services/analytics.dart';
import 'package:untitled2/ui/profile.dart';


import 'package:untitled2/util/colors.dart';
import 'package:untitled2/util/dimen.dart';
import 'package:untitled2/util/styles.dart';
import 'package:untitled2/util/dialog.dart';
import 'package:untitled2/util/appBar.dart';

import 'FeedPage.dart';
import 'explore_screen.dart';



class ProfileEdit extends StatefulWidget {
  const ProfileEdit({Key? key}) : super(key: key);

  @override
  State<ProfileEdit> createState() => _ProfileEditState();

  static const String routeName = "/profileEdit";
}

class _ProfileEditState extends State<ProfileEdit> {

  bool value = false;

  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;

    void onTap(index) {
      setState(() {
        selectedIndex = index;
        if(index == 0)
        {
          Navigator.pushNamedAndRemoveUntil(context, FeedPage.routeName, (route) => false);
        }
        else if(index == 1)
        {
          Navigator.pushNamedAndRemoveUntil(context, ExploreScreen.routeName, (route) => false);
        }
        else if(index == 2)
        {
          Navigator.pushNamedAndRemoveUntil(context, ProfileEdit.routeName, (route) => false);
        }
        else if(index == 3)
        {

        }
        else if(index == 4)
        {
          Navigator.pushNamedAndRemoveUntil(context, Profile.routeName, (route) => false);
        }
      });
    }
    SizeConfig().init(context);
    setCurrentScreen(analytics, "Profile Edit Page", "profile_edit.dart") ;
    return Scaffold(
      appBar: welcomeBar("Settings"),

      body: SafeArea(
        maintainBottomViewPadding: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: SizeConfig.blockSizeVertical*7,
              margin: EdgeInsets.symmetric(horizontal: SizeConfig.blockSizeHorizontal*10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(80),
                child: FlatButton(
                  color: AppColors.buttonColor,
                  onPressed: () {
                    Navigator.pushNamed(context, "/changePassword");
                  },
                  child: Text(
                    "Change Password",
                    style: welcomeButtonTextStyle,
                  ),
                ),
              ),
            ),
            Container(
              height: SizeConfig.blockSizeVertical*7,
              margin: EdgeInsets.symmetric(horizontal: SizeConfig.blockSizeHorizontal*10),
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
                          style: welcomeButtonTextStyle,
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
              height: SizeConfig.blockSizeVertical*7,
              margin: EdgeInsets.symmetric(horizontal: SizeConfig.blockSizeHorizontal*10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(80),
                child: FlatButton(
                  color: AppColors.buttonColor,
                  onPressed: () {
                    showInfoDialog("Delete Account", "Are you sure you want to delete the account?", context);
                  },
                  child: Text(
                    "Delete Account",
                    style: welcomeButtonTextStyle,
                  ),
                ),
              ),
            ),
          ],
        ),

      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: AppColors.mainColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',


          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pin_drop),
            label: 'Map',

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt_outlined),
            label: 'Camera',

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',


          ),
        ],
        onTap: onTap,
      )



    );
  }
}
