import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/model/Posts.dart';
import 'package:untitled2/ui/notifications.dart';
import 'package:untitled2/ui/profile.dart';
import 'package:untitled2/util/appBar.dart';
import '../util/colors.dart';
import 'explore_screen.dart';
import 'package:untitled2/classes/post.dart';
import "package:untitled2/services/analytics.dart";




class FeedPage extends StatefulWidget {
  const FeedPage({Key? key}) : super(key: key);
  static const String routeName = "/feedPage";

  @override
  State<FeedPage> createState() => _FeedPageState();
}




class _FeedPageState extends State<FeedPage> {

  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;
    final x =Post(text: 'Starbucks',
        date: 'January 20',
        likes: ["aasd", "asdfas"],
        dislikes: ["saldf", "asdfasd"],
        comments: ["asdfas", "asdf"],
        location: "Kadıköy",
        picture: "link",
        topic: "asdfa",
        userId: "asdfasd",
        postingTime: "sadfsd"

    );

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

    setCurrentScreen(analytics, "Feed Page", "feedPage.dart") ;
    return  Scaffold(
      appBar: pageBar(context, Notifications.routeName),
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                card(x,
                    "Ali",
                    "Yıldırım",
                    "Mon Nov 13 2022 17:32:10",
                    "McDonald's Kadıköy",
                    "I enjoyed the hamburger but since it was a very crowded restaurant, the timing was very bad and it was a bit cold.",
                    "https://b.zmtcdn.com/data/pictures/0/5906110/69769ab70089bf3573fcb90c62703640.jpg",
                    context),
                card(x,
                    "Ali",
                    "Yıldırım",
                    "Mon Nov 13 2022 17:32:10",
                    "McDonald's Kadıköy",
                    "I enjoyed the hamburger but since it was a very crowded restaurant, the timing was very bad and it was a bit cold.",
                    "https://b.zmtcdn.com/data/pictures/0/5906110/69769ab70089bf3573fcb90c62703640.jpg",
                    context),


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