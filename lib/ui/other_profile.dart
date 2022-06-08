import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/model/notif.dart';
import 'package:untitled2/services/analytics.dart';
import 'package:untitled2/services/authentication.dart';
import 'package:untitled2/ui/explore_screen.dart';
import 'package:untitled2/ui/profile.dart';
import 'package:untitled2/ui/profile_edit.dart';
import 'package:untitled2/util/colors.dart';
import 'package:untitled2/util/styles.dart';
import 'package:untitled2/util/dimen.dart';
import 'package:untitled2/model/user.dart';
import 'package:untitled2/model/Posts.dart';
import 'package:untitled2/ui/post_card.dart';
import 'FeedPage.dart';
import 'package:untitled2/services/database.dart';

import '../util/styles.dart';

class OtherProfilePage extends StatefulWidget {
  const OtherProfilePage({this.data});

  final Map<String, dynamic>? data;

  @override
  State<OtherProfilePage> createState() => _OtherProfilePageState();
}

class _OtherProfilePageState extends State<OtherProfilePage> {

  @override
  Widget build(BuildContext context) {

    int selectedIndex = 0;
    //final snapshot = FirebaseFirestore.instance.collection('customers').doc(user.uid).get();
    //OurUser? currentUser = Provider.of<OurUser?>(context);
    //print(currentUser!.method);


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
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 10,
          title: Text("Hot Pins",
              style: headingTextStyle),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[AppColors.primary, AppColors.secondary]
                )
            ),
          ),
          actions: [
            Padding(
              padding:  EdgeInsets.only(right: SizeConfig.blockSizeVertical*2),
              child: GestureDetector(
                  onTap: (){},
                  child: const Icon(
                    Icons.settings,
                    size: 27,
                  )
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.only(left: SizeConfig.blockSizeVertical),
              child: Column(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, SizeConfig.blockSizeVertical*4, SizeConfig.blockSizeHorizontal*7, 0),
                          child: CircleAvatar(
                            radius: 60,
                            child: ClipOval(
                              child: Image.network(
                                widget.data!['profilepic'],
                                fit: BoxFit.fill,
                                width: SizeConfig.screenWidth/3,
                              ),
                            ),
                          ),
                        ),

                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, SizeConfig.blockSizeVertical*4, SizeConfig.blockSizeHorizontal*5, 0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,

                                children: [

                                  Text(
                                    widget.data!['username'],
                                    style: profileNameTextStyle,
                                  ),

                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [


                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,

                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: SizeConfig.blockSizeVertical*2),
                                      child: Text(
                                          widget.data!['Posts'].length.toString(),
                                          style: profileTextStyle
                                      ),
                                    ),
                                    Text('Posts',
                                        style: profileTextStyle
                                    )
                                  ],
                                ),
                                SizedBox(width: SizeConfig.blockSizeHorizontal*5),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: SizeConfig.blockSizeVertical*2),
                                      child: Text(widget.data!['Followers'].length.toString(),
                                          style: profileTextStyle),
                                    ),
                                    Text('Follower',
                                        style: profileTextStyle)
                                  ],
                                ),
                                SizedBox(width: SizeConfig.blockSizeHorizontal*5),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children:  [
                                    Padding(
                                      padding: EdgeInsets.only(top: SizeConfig.blockSizeVertical*2),
                                      child: Text(widget.data!['Following'].length.toString(),
                                          style: profileTextStyle),
                                    ),
                                    Text('Following',
                                        style: profileTextStyle)
                                  ],
                                ),
                              ],
                            ),

                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: SizeConfig.blockSizeVertical*2),
                                  child: Container(
                                    height: SizeConfig.screenHeight/20,
                                    width: SizeConfig.screenWidth/2,
                                    margin: EdgeInsets.only(top:SizeConfig.blockSizeVertical*2),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(80),
                                      child: FlatButton(
                                        color: AppColors.mainColor,
                                        onPressed: () {},
                                        child: Text(
                                          "Follow",
                                          style: loginTextStyle,

                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ]
                  ),
                  Column(

                  ),
                ],
              ),
            ),
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
