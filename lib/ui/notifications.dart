import 'package:flutter/material.dart';
import 'package:untitled2/classes/notif_card.dart';
import 'package:untitled2/model/notif.dart';
import 'package:untitled2/util/colors.dart';
import 'package:untitled2/util/appBar.dart';
import 'package:untitled2/util/dimen.dart';
import 'package:untitled2/ui/profile.dart';
import 'package:untitled2/ui/profile_edit.dart';
import 'package:untitled2/ui/explore_screen.dart';
import 'package:untitled2/ui/feedPage.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);
  static const String routeName = "/notificaton";

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 0;

    void _ONTAP(index) {
      setState(() {
        _selectedIndex = index;
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
    String like = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSLudBUAQNGPerdvGD3gHqObUr1mYm7lk383w&usqp=CAU';
    String comment = 'https://www.nicepng.com/png/detail/207-2078186_comment-free-icon-comment-free-download.png';
    Notif x = Notif(
      userId: "1",
      otherUserId: "2",
      notifType: 2,
      postId: "3",
    );
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: welcomeBar("Notifications"),
      body: ListView(
        children: <Widget>[
          notifCard(like,
              "AhseniHamza liked your post!",
            x
          ),
          notifCard(like,
              "Aas liked your post!",
            x
          ),
          notifCard(comment,
              "AhseniHamza commented on your post!",
            x
          ),
          notifCard(like,
            "AhseniHamza liked your post!",
            x
          ),
          notifCard(comment,
              "AhseniHamza commented on your post!",
            x
          ),
          notifCard(like,
              "AhseniHamza liked your post!",
            x
          ),
          notifCard(like,
              "AhseniHamza liked your post!",
            x
          ),
          notifCard(like,
              "Aas liked your post!",
            x
          ),

        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
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
        onTap: _ONTAP,
      ),
    );
  }
}