import 'package:flutter/material.dart';

import 'package:untitled2/main.dart';
import 'package:untitled2/util/colors.dart';
import 'package:untitled2/util/styles.dart';
import 'package:untitled2/util/dialog.dart';



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
      bottomNavigationBar: BottomNavigationBar(

        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.orange,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
            backgroundColor: Colors.orange,

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pin_drop),
            label: 'Map',
            backgroundColor: Colors.orange,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt_outlined),
            label: 'Camera',
            backgroundColor: Colors.orange,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
            backgroundColor: Colors.orange,

          ),
        ],
        //onTap: ONTAP,
      ),



    );
  }
}
